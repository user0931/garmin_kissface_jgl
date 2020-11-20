using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;
using Toybox.Lang as Lang;
using Toybox.ActivityMonitor as Act;
using Toybox.Math as Mt;

module Status {

	function drawText(dc, cx, cy) {
        
        var info = Act.getInfo();
        
        // status
        var msg =  "p00p";   
        var unit = "";
        var calc1 = 0;
        var calc2 = 0;
        var calc3 = 0;
        var calc4 = 0;
        /*if (info.moveBarLevel == Act.MOVE_BAR_LEVEL_MAX) {
        //if (1) {
            msg = "¯\\_(o.o)_/¯";
            dc.setColor(Utils.getColorMode(), Gfx.COLOR_BLACK);
            dc.drawText(cx, 206, Gfx.FONT_SMALL, msg, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);
        }
        else {*/
        //    Sys.print("loop=");
        //    Sys.println(loop);
        var bitmap = Ui.loadResource(Rez.Drawables.steps);
        
        // Pasos
        msg = info.steps - info.stepGoal;
        dc.setColor(Goals.getStepsColor(), Gfx.COLOR_TRANSPARENT);
        bitmap = Ui.loadResource(Rez.Drawables.steps);
        calc1= simple(msg);
        //dc.drawBitmap(cx-60, 197, bitmap);        
        //dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        //dc.drawText(cx-17, 206, Gfx.FONT_SMALL, msg, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawBitmap(cx-85, 190, bitmap);        
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(cx-52, 199, Gfx.FONT_SMALL, calc1, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);
        
        // Pisos
        msg = info.floorsClimbed - info.floorsClimbedGoal;
        unit = "fl";
        dc.setColor(Goals.getFloorsColor(), Gfx.COLOR_TRANSPARENT);
        bitmap = Ui.loadResource(Rez.Drawables.floors);
        calc2= simple(msg);
        dc.drawBitmap(cx-10, 190, bitmap);        
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(cx+20, 199, Gfx.FONT_SMALL, calc2, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);
        
        // Tiempo de actividad
        msg = Goals.getActive() - Goals.getActiveGoal();
        unit = "min";
        dc.setColor(Goals.getActiveColor(), Gfx.COLOR_TRANSPARENT);
        bitmap = Ui.loadResource(Rez.Drawables.active);
        calc3= simple(msg);
        dc.drawBitmap(cx-85, 215, bitmap);        
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(cx-52, 224, Gfx.FONT_SMALL, calc3, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);
        
        // Calorias
        msg = Goals.getCalories() - Goals.getCaloriesGoal();
        unit = "kCal";
        dc.setColor(Goals.getCaloriesColor(), Gfx.COLOR_TRANSPARENT);
        bitmap = Ui.loadResource(Rez.Drawables.move);
        calc4= simple(msg);
        dc.drawBitmap(cx-15, 215, bitmap);        
        dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(cx+20, 224, Gfx.FONT_SMALL, calc4, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);
                       
		unit = false;  
        if (unit) {
        	msg += " " + unit;
        }
        
        //}
	}

	function simple(msg) {
	    if  (msg < 0) {
	        if (msg < -1000) {
		        msg = Mt.round(msg/1000) + "k";
		    }
		} else if  (msg >= 0) {
	        if (msg > 1000) {
		        msg = "+" + Mt.round(msg/1000) + "k";
		    }
		    else {
		        msg = "+" + msg;
		    }
		  }
		  else {
		         Sys.print("Error que lo flipas:calc=");
        	     Sys.println(msg);
		  } 
		var pos = msg.toString().find(".");
		if (pos) {
			msg = msg.toString().substring(0, pos + 2);
		}
		return msg;
	}

}