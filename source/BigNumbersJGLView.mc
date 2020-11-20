using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.System as Sys;

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
        // cycle loop, for status
        loop++;
        loop = loop % 4;
    
        dc.setColor(dc.COLOR_BLACK,dc.COLOR_BLACK);
        dc.clear();
        
        // Get and show the current time
        var clockTime = System.getClockTime();
       
        // Call the parent onUpdate function to redraw the layout
        // View.onUpdate(dc);
         
         // show time
        Time.drawText(dc, cx, cy);        
        
        // draw battery
        Battery.drawArc(dc, cx, cy);
        
         // show date
        //Date.drawText(dc, cx, 35);
        Date.drawText(dc, cx, 25);
        
        // are alarms ON
       // if (Alarms.areAlarms()) {
       //     Alarms.drawIcon(dc, cx + 50, 25);
       // }
        
        // write heart rate
        if (HeartRate.hrON()) {
           //HeartRate.drawText(dc, cx-5, cy-10);
             HeartRate.drawText(dc, cx, cy-15);
        }
        
         // show status
        // Status.drawText(dc, cx, cy, loop);
        Status.drawText(dc, cx, cy);
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
