(function($) {

    $.fn.setTouchStart = function(touchEventHandler) {

        var isTouch = ('ontouchstart' in window);

        // PC/SmartPhone両対応
        $(this).off('touchstart');
        $(this).on('touchstart', touchEventHandler);

        $(this).off('mousedown');
        $(this).on('mousedown', touchEventHandler);

        // SmartPhoneでもmouseイベントを拾ってしまう端末が存在するため、
        // タッチできる環境(SmartPhone)であればマウス操作不可にする。
        if(isTouch){
            $(this).off('mousedown', touchEventHandler);
        }

    }

    $.fn.setTouchEnd = function(touchEventHandler) {

        var isTouch = ('ontouchstart' in window);

        // PC/SmartPhone両対応
        $(this).off('touchend',);
        $(this).on('touchend', touchEventHandler);

        $(this).off('mouseup');
        $(this).on('mouseup', touchEventHandler);

        // SmartPhoneでもmouseイベントを拾ってしまう端末が存在するため、
        // タッチできる環境(SmartPhone)であればマウス操作不可にする。
        if(isTouch){
            $(this).off('mouseup', touchEventHandler);
        }

    }

    $.fn.setTouchMove = function(touchEventHandler) {

        var isTouch = ('ontouchstart' in window);

        // PC/SmartPhone両対応
        $(this).off('touchmove');
        $(this).on('touchmove', touchEventHandler);

        $(this).off('mousemove');
        $(this).on('mousemove', touchEventHandler);

        // SmartPhoneでもmouseイベントを拾ってしまう端末が存在するため、
        // タッチできる環境(SmartPhone)であればマウス操作不可にする。
        if(isTouch){
            $(this).off('mousemove', touchEventHandler);
        }

    }

})(jQuery)
