var app = {
    init: function() {
        this.address = $('#address');
        this.address.attr('placeholder', localStorage.getItem('address') || '127.0.0.1:3000');
        $(document).on('deviceready', this.ready.bind(this));
    },

    ready: function() {
        cordova.getAppVersion.getVersionNumber(function(version) {
            $('.version').html(version);
        });

        window.plugins.insomnia.allowSleepAgain();

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
        window.location = address + '/dev.html?platform=' + device.platform + '&model=' + device.model + '&' + Date.now();
    },

    connect: function(event) {
        event.preventDefault();
        var address = this.address.val() || this.address.attr('placeholder');
        if (!address) return;

        localStorage.setItem('address', address);

        $('input').hide();
        $('.connect a').hide();
        $('#status').show();
        $('#status').html('Connecting...');

        address = 'http://' + address.replace('http://', '');

        setTimeout(this.startConnecting.bind(this, address), 200);
    },

    startConnecting: function(address) {
        $.ajax({
            type: 'POST',
            url: address + '/register',
            data: JSON.stringify({
                platform: device.platform,
                model: device.model
            }),
            contentType: 'application/json',
            timeout: 8000,
            success: this.onSuccess.bind(this, address),
            error: this.onError.bind(this)
        });
    }
};

app.init();
