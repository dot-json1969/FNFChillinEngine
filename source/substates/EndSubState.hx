package substates;

import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;

class EndSubState extends MusicBeatSubstate
{
    var bfCheeringYouOn:FlxSprite; 

    public function new()
    {
        super();

        Application.current.window.title += ' [END]';

        PlayState.game.isEnding = true;
        FlxG.sound.music.stop();
        PlayState.game.vocals.stop();

        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width * 2, FlxG.height * 2, 0xFFFFFFFF);
        bg.alpha = 0.6;
        bg.scrollFactor.set();
        add(bg);

        var checker:FlxBackdrop = new FlxBackdrop(FlxGridOverlay.createGrid(75, 75, 150, 150, true, 0xFF000000, 0x0));
        checker.alpha = 0.3;
        checker.velocity.set(26, 26);
        checker.scrollFactor.set();
        add(checker);

        bfCheeringYouOn = new FlxSprite();
        bfCheeringYouOn.frames = Paths.getSparrowAtlas('endScreen/bf', 'shared');
        bfCheeringYouOn.animation.addByIndices('uhh', 'yayy0', [0,1], '', 24, false);
        bfCheeringYouOn.animation.addByPrefix('yippee', 'yayy0', 24, false);
        bfCheeringYouOn.animation.addByPrefix('tbh', 'yayy loop', 24, true);
        bfCheeringYouOn.animation.play('uhh', true);
        bfCheeringYouOn.screenCenter();
        bfCheeringYouOn.x = 150;
        add(bfCheeringYouOn);

        new FlxTimer().start(2.6, function(tmr:FlxTimer) {
            bfCheeringYouOn.animation.play('yippee', true);
        });
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (controls.ACCEPT)
            PlayState.game.endSong();
    }
}