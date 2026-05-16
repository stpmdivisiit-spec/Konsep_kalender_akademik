<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Kalender Akademik - SB Admin Pro Style</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <style>
        body {
            background-color: #f2f6fc; /* Warna background soft khas admin panel */
            font-family: 'Nunito', sans-serif;
            padding-top: 2rem;
        }

        /* Card Styling a la SB Admin Pro */
        .card {
            border: none;
            border-radius: 0.5rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(33, 40, 50, 0.15);
        }
        .card-header {
            background-color: #fff;
            border-bottom: 1px solid #e3e6ec;
            padding: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .text-primary-custom {
            color: #0061f2; /* Warna khas SB Admin Pro */
            font-weight: 700;
        }

        /* Calendar Styling */
        .calendar-table {
            width: 100%;
            table-layout: fixed;
            margin-bottom: 0;
        }
        .calendar-table th {
            text-align: center;
            text-transform: uppercase;
            font-size: 0.75rem;
            font-weight: 800;
            color: #69707a;
            padding: 15px 0;
            border-bottom: 2px solid #e3e6ec;
            background-color: #f8f9fa;
        }
        .calendar-day {
            width: 14.28%;
            height: 120px; /* Sedikit lebih tinggi agar lega */
            vertical-align: top !important;
            border: 1px solid #e3e6ec;
            padding: 5px !important;
            transition: background-color 0.2s;
        }
        .calendar-day:hover {
            background-color: #fafbfc;
        }
        .calendar-day .date {
            text-align: right;
            font-weight: 700;
            color: #363d47;
            margin-bottom: 5px;
        }
        .calendar-day.outside .date {
            color: #d4dae3;
        }
        .calendar-day.selected {
            background-color: #eef2f7;
        }
        .today {
            background-color: #fff8e1 !important; /* Highlight hari ini */
        }

        /* Event Styling Modern */
        .event {
            font-size: 0.75rem;
            padding: 4px 8px;
            margin-bottom: 4px;
            border-radius: 4px;
            cursor: pointer;
            color: white;
            font-weight: 600;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: transform 0.1s;
        }
        .event:hover {
            transform: translateY(-1px);
            opacity: 0.9;
        }

        /* Warna Kategori Event Modern */
        .event-success { background-color: #0cc27e; } /* Hijau Teal */
        .event-info { background-color: #36b9cc; } /* Cyan */
        .event-warning { background-color: #f4a100; } /* Orange */
        .event-important { background-color: #e74a3b; } /* Merah */
        .event-inverse { background-color: #5a5c69; } /* Abu Gelap */
        
        /* Navigasi Kalender */
        .cal-nav-btn {
            border: 1px solid #e3e6ec;
            color: #69707a;
            background: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: 600;
        }
        .cal-nav-btn:hover {
            background-color: #f8f9fa;
            color: #0061f2;
        }
        .cal-nav-btn.active {
            background-color: #0061f2;
            color: white;
            border-color: #0061f2;
        }

    </style>
</head>
<body>

<div class="container-fluid px-4">
    <div class="d-sm-flex align-items-center justify-content-between mb-4 mt-3">
        <h1 class="h3 mb-0 text-gray-800">Kalender Akademik</h1>
        <button class="btn btn-primary shadow-sm" onclick="openModal()">
            <i class="fas fa-plus fa-sm text-white-50 me-1"></i> Tambah Kegiatan
        </button>
    </div>

    <div class="card shadow mb-4">
        <div class="card-header">
            <span class="text-primary-custom">Jadwal STPM Santa Ursula (2025-2026)</span>
            </div>
        <div class="card-body p-0">
            <div id="holder" class="table-responsive"></div>
        </div>
    </div>
</div>

<div class="modal fade" id="eventModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-light">
        <h5 class="modal-title" id="modalTitle">Tambah/Edit Kegiatan</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="eventForm">
            <input type="hidden" id="eventId" name="id">
            <div class="mb-3">
                <label class="form-label small text-muted fw-bold">JUDUL KEGIATAN</label>
                <input type="text" class="form-control" id="eventTitle" name="title" required>
            </div>
            <div class="mb-3">
                <label class="form-label small text-muted fw-bold">DESKRIPSI</label>
                <textarea class="form-control" id="eventDesc" name="description" rows="3"></textarea>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label small text-muted fw-bold">MULAI</label>
                    <input type="datetime-local" class="form-control" id="eventStart" name="start_date" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label small text-muted fw-bold">SELESAI</label>
                    <input type="datetime-local" class="form-control" id="eventEnd" name="end_date" required>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label small text-muted fw-bold">WARNA / KATEGORI</label>
                <select class="form-select" id="eventCat" name="category">
                    <option value="event-info">Biru (Info)</option>
                    <option value="event-success">Hijau (Sukses)</option>
                    <option value="event-warning">Kuning (Peringatan)</option>
                    <option value="event-important">Merah (Penting)</option>
                    <option value="event-inverse">Abu-abu (Lainnya)</option>
                </select>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger me-auto" id="btnDelete" style="display:none;" onclick="deleteEvent()">
            <i class="fas fa-trash"></i> Hapus
        </button>
        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Batal</button>
        <button type="button" class="btn btn-primary" onclick="saveEvent()">Simpan</button>
      </div>
    </div>
  </div>
</div>

<script type="text/tmpl" id="tmpl">
  {{ 
  var date = date || new Date(),
      month = date.getMonth(), 
      year = date.getFullYear(), 
      first = new Date(year, month, 1), 
      last = new Date(year, month + 1, 0),
      startingDay = first.getDay(), 
      thedate = new Date(year, month, 1 - startingDay),
      dayclass = lastmonthcss,
      today = new Date(),
      i, j; 
  if (mode === 'week') {
    thedate = new Date(date);
    thedate.setDate(date.getDate() - date.getDay());
    first = new Date(thedate);
    last = new Date(thedate);
    last.setDate(last.getDate()+6);
  } else if (mode === 'day') {
    thedate = new Date(date);
    first = new Date(thedate);
    last = new Date(thedate);
    last.setDate(thedate.getDate() + 1);
  }
  }}
  
  <div class="d-flex justify-content-between align-items-center p-3 border-bottom bg-light">
      <div class="d-flex align-items-center">
        <div class="btn-group me-3">
            <button class="cal-nav-btn js-cal-prev"><i class="fas fa-chevron-left"></i></button>
            <button class="cal-nav-btn js-cal-next"><i class="fas fa-chevron-right"></i></button>
        </div>
        <h4 class="mb-0 fw-bold text-dark">
            {{ if (mode !== 'day') { }}
                {{: months[month] }} {{: year}}
            {{ } else { }}
                {{: date.toDateString() }}
            {{ } }}
        </h4>
      </div>
      <div>
        <div class="btn-group" role="group">
            <button class="cal-nav-btn js-cal-option {{: first.toDateInt() <= today.toDateInt() && today.toDateInt() <= last.toDateInt() ? 'active':'' }}" data-date="{{: today.toISOString()}}" data-mode="month">Hari Ini</button>
            <button class="cal-nav-btn js-cal-option {{: mode==='year'? 'active':'' }}" data-mode="year">Thn</button>
            <button class="cal-nav-btn js-cal-option {{: mode==='month'? 'active':'' }}" data-mode="month">Bln</button>
            <button class="cal-nav-btn js-cal-option {{: mode==='week'? 'active':'' }}" data-mode="week">Mgg</button>
            <button class="cal-nav-btn js-cal-option {{: mode==='day'? 'active':'' }}" data-mode="day">Hari</button>
        </div>
      </div>
  </div>

  <table class="calendar-table">
    {{ if (mode ==='year') { month = 0; }}
    <tbody>
      {{ for (j = 0; j < 3; j++) { }}
      <tr>
        {{ for (i = 0; i < 4; i++) { }}
        <td class="calendar-month month-{{:month}} js-cal-option p-4 text-center fw-bold text-primary" data-date="{{: new Date(year, month, 1).toISOString() }}" data-mode="month" style="cursor:pointer; border:1px solid #eee;">
          {{: months[month] }}
          {{ month++;}}
        </td>
        {{ } }}
      </tr>
      {{ } }}
    </tbody>
    {{ } }}
    {{ if (mode ==='month' || mode ==='week') { }}
    <thead>
      <tr class="c-weeks">
        {{ for (i = 0; i < 7; i++) { }}
          <th class="c-name">
            {{: days[i] }}
          </th>
        {{ } }}
      </tr>
    </thead>
    <tbody>
      {{ for (j = 0; j < 6 && (j < 1 || mode === 'month'); j++) { }}
      <tr>
        {{ for (i = 0; i < 7; i++) { }}
        {{ if (thedate > last) { dayclass = nextmonthcss; } else if (thedate >= first) { dayclass = thismonthcss; } }}
        <td class="calendar-day {{: dayclass }} {{: thedate.toDateCssClass() }} {{: date.toDateCssClass() === thedate.toDateCssClass() ? 'selected':'' }} {{: daycss[i] }} js-cal-option" data-date="{{: thedate.toISOString() }}">
          <div class="date">{{: thedate.getDate() }}</div>
          {{ thedate.setDate(thedate.getDate() + 1);}}
        </td>
        {{ } }}
      </tr>
      {{ } }}
    </tbody>
    {{ } }}
    {{ if (mode ==='day') { }}
    <tbody>
      <tr>
        <td colspan="7" class="p-3">
            <div class="alert alert-info border-0 shadow-sm"><i class="fas fa-info-circle me-2"></i> Tampilan Harian (Detail)</div>
        </td>
      </tr>
    </tbody>
    {{ } }}
  </table>
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // --- Helper JS dari Skrip Asli ---
    var $currentPopover = null;
    $(document).on('shown.bs.popover', function (ev) {
        var $target = $(ev.target);
        if ($currentPopover && ($currentPopover.get(0) != $target.get(0))) { $currentPopover.popover('toggle'); }
        $currentPopover = $target;
    }).on('hidden.bs.popover', function (ev) {
        var $target = $(ev.target);
        if ($currentPopover && ($currentPopover.get(0) == $target.get(0))) { $currentPopover = null; }
    });

    $.extend({
        quicktmpl: function (template) {return new Function("obj","var p=[],print=function(){p.push.apply(p,arguments);};with(obj){p.push('"+template.replace(/[\r\t\n]/g," ").split("{{").join("\t").replace(/((^|\}\})[^\t]*)'/g,"$1\r").replace(/\t:(.*?)\}\}/g,"',$1,'").split("\t").join("');").split("}}").join("p.push('").split("\r").join("\\'")+"');}return p.join('');")}
    });

    $.extend(Date.prototype, {
        toDateCssClass:  function () { return '_' + this.getFullYear() + '_' + (this.getMonth() + 1) + '_' + this.getDate(); },
        toDateInt: function () { return ((this.getFullYear()*12) + this.getMonth())*32 + this.getDate(); },
        toTimeString: function() {
            var hours = this.getHours(), minutes = this.getMinutes(), hour = (hours > 12) ? (hours - 12) : hours, ampm = (hours >= 12) ? ' pm' : ' am';
            if (hours === 0 && minutes===0) { return ''; }
            if (minutes > 0) { return hour + ':' + minutes + ampm; }
            return hour + ampm;
        }
    });

    // --- Plugin Kalender yang Dimodifikasi ---
    (function ($) {
        var t = $.quicktmpl($('#tmpl').get(0).innerHTML);
        
        function calendar($el, options) {
            $el.on('click', '.js-cal-prev', function () {
                switch(options.mode) {
                case 'year': options.date.setFullYear(options.date.getFullYear() - 1); break;
                case 'month': options.date.setMonth(options.date.getMonth() - 1); break;
                case 'week': options.date.setDate(options.date.getDate() - 7); break;
                case 'day':  options.date.setDate(options.date.getDate() - 1); break;
                }
                draw();
            }).on('click', '.js-cal-next', function () {
                switch(options.mode) {
                case 'year': options.date.setFullYear(options.date.getFullYear() + 1); break;
                case 'month': options.date.setMonth(options.date.getMonth() + 1); break;
                case 'week': options.date.setDate(options.date.getDate() + 7); break;
                case 'day':  options.date.setDate(options.date.getDate() + 1); break;
                }
                draw();
            }).on('click', '.js-cal-option', function () {
                var $t = $(this), o = $t.data();
                if (o.date) { o.date = new Date(o.date); }
                $.extend(options, o);
                draw();
            }).on('click', '.event', function (e) {
                e.stopPropagation(); 
                var index = $(this).data('index');
                var data = options.data[index];
                openModal(data);
                return false;
            });
            
            function monthAddEvent(index, event) {
                var $event = $('<div/>', {'class': 'event ' + (event.class || 'event-info'), text: event.title, title: event.title, 'data-index': index}),
                    e = new Date(event.start),
                    dateclass = e.toDateCssClass(),
                    day = $('.' + e.toDateCssClass()),
                    empty = $('<div/>', {'class':'clear event', html:'&nbsp;'}), 
                    numbevents = 0, 
                    time = event.start.toTimeString(),
                    endday = event.end && $('.' + event.end.toDateCssClass()).length > 0;
                
                if (day.length) {
                    day.append($event);
                }
            }

            function draw() {
                $el.html(t(options));
                $('.' + (new Date()).toDateCssClass()).addClass('today');
                if (options.data && options.data.length) {
                    $.each(options.data, monthAddEvent);
                }
            }
            draw();     
        }
        
        $.fn.calendar = function (options) {
            return this.each(function () { calendar($(this), $.extend({}, {
                days: ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"],
                months: ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"],
                shortMonths: ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des"],
                date: (new Date()),
                daycss: ["c-sunday", "", "", "", "", "", "c-saturday"],
                todayname: "Hari Ini",
                thismonthcss: "current",
                lastmonthcss: "outside",
                nextmonthcss: "outside",
                mode: "month",
                data: []
            }, options)); });
        };
    })(jQuery);

    // --- LOGIKA APLIKASI (AJAX & CRUD) ---

    // 1. Fungsi Memuat Data dari Database
    function loadEvents() {
        $.ajax({
            url: 'api.php?action=fetch',
            method: 'GET',
            success: function(response) {
                var events = response.map(function(item) {
                    return {
                        id: item.id,
                        title: item.title,
                        text: item.text,
                        start: new Date(item.start),
                        end: new Date(item.end),
                        class: item.class
                    };
                });

                $('#holder').empty();
                $('#holder').calendar({
                    data: events,
                    date: new Date('2025-07-01') 
                });
            }
        });
    }

    // 2. Fungsi Buka Modal (Disewuaikan untuk BS5)
    var myModal = new bootstrap.Modal(document.getElementById('eventModal'));

    function openModal(data = null) {
        if (data) {
            // Mode Edit
            $('#modalTitle').text('Edit Kegiatan');
            $('#eventId').val(data.id);
            $('#eventTitle').val(data.title);
            $('#eventDesc').val(data.text);
            $('#eventStart').val(toISOLocal(data.start));
            $('#eventEnd').val(toISOLocal(data.end));
            $('#eventCat').val(data.class);
            $('#btnDelete').show();
        } else {
            // Mode Tambah Baru
            $('#modalTitle').text('Tambah Kegiatan Baru');
            $('#eventForm')[0].reset();
            $('#eventId').val('');
            $('#btnDelete').hide();
        }
        myModal.show();
    }

    // 3. Simpan Data
    function saveEvent() {
        var formData = $('#eventForm').serialize();
        $.post('api.php?action=save', formData, function(response) {
            if(response.status === 'success') {
                myModal.hide();
                loadEvents();
            } else {
                alert('Gagal menyimpan: ' + response.message);
            }
        }, 'json');
    }

    // 4. Hapus Data
    function deleteEvent() {
        if(confirm('Yakin ingin menghapus kegiatan ini?')) {
            var id = $('#eventId').val();
            $.post('api.php?action=delete', {id: id}, function(response) {
                if(response.status === 'success') {
                    myModal.hide();
                    loadEvents();
                } else {
                    alert('Gagal menghapus');
                }
            }, 'json');
        }
    }

    function toISOLocal(d) {
        var z = n => ('0' + n).slice(-2);
        return d.getFullYear()+'-'+z(d.getMonth()+1)+'-'+z(d.getDate())+'T'+z(d.getHours())+':'+z(d.getMinutes());
    }

    $(document).ready(function() {
        loadEvents();
    });
</script>

</body>
</html>