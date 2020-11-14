using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;

class BigNumbersJGLView extends WatchUi.WatchFace {
	
	var myfonts = null;
	hidden var cx;
    hidden var cy;
    hidden var loop = 1;
    hidden var active;
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        // cycle loop, for status
        loop++;
        loop = loop % 4;
        
        //setLayout(Rez.Layouts.WatchFace(dc));
        myfonts=WatchUi.loadResource(Rez.Fonts.myfonts);
        
        // G spot
        cx = dc.getWidth() / 2;
        cy = dc.getHeight() / 2;
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        dc.setColor(dc.COLOR_BLACK,dc.COLOR_BLACK);
        dc.clear();
        
        // Get and show the current time
        var clockTime = System.getClockTime();
        /*dc.setColor(dc.COLOR_WHITE,dc.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, 50,myfonts,Lang.format("$1$",[clockTime.hour]),dc.TEXT_JUSTIFY_RIGHT);
        dc.setColor(dc.COLOR_YELLOW,dc.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, 50,myfonts,Lang.format("$1$",[clockTime.min.format("%02d")]),dc.TEXT_JUSTIFY_LEFT);*/
        
        // Call the parent onUpdate function to redraw the layout
        // View.onUpdate(dc);
        
        // show time
        //Time.drawText(dc, cx, cy);
        
         // show time
        Time.drawText(dc, cx, cy);
        //System.println("Estoy en 0040");
        
        
        // draw battery
        Battery.drawArc(dc, cx, cy);
        
         // show date
        Date.drawText(dc, cx, 35);
        
        // are alarms ON
       // if (Alarms.areAlarms()) {
       //     Alarms.drawIcon(dc, cx + 50, 25);
       // }
        
        // write heart rate
        if (HeartRate.hrON()) {
             HeartRate.drawText(dc, cx, cy);
        }
        
         // show status
        Status.drawText(dc, cx, cy, loop);
        
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
