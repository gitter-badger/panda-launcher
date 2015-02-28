
var app = {
    init: function() {
        this.address = document.getElementById('address');
        this.address.value = localStorage.getItem('address') || '127.0.0.1:3000';

        $(document).on('deviceready', this.ready.bind(this));
        $(document).on('ready', this.ready.bind(this));
    },

    ready: function() {
        $('.connect a').on('touchstart', function() {
            $(this).addClass('active');
        });
        $('.connect a').on('touchend', function() {
            $(this).removeClass('active');
        });
        $('.connect a').click(this.connect.bind(this));
    },

    onError: function() {
        $('input').show();
        $('.connect a').show();
        $('#status').hide();
    },

    onSuccess: function(address) {
        window.plugins.insomnia.keepAwake();
        window.location = address;
    },

    connect: function(event) {
        event.preventDefault();
        var address = this.address.value;
        if (!address) return;

        localStorage.setItem('address', address);

        $('input').hide();
        $('.connect a').hide();
        $('#status').show();
        $('#status').html('Connecting...');

        address = 'http://' + address.replace('http://', '') + '/dev.html';

        setTimeout(this.startConnecting.bind(this, address), 200);
    },

    startConnecting: function(address) {
        $.ajax({
            url: address,
            timeout: 8000,
            success: this.onSuccess.bind(this, address),
            error: this.onError.bind(this)
        });
    }
};

app.init();
