-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Dante B
-- Date: 2018-04-10
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local jouerButton
local creditsButton
local creditsFrenchButton
local instructionsButton
local instructionsFrenchButton
local muteButton
local unmuteButton
local englishButton
local frenchButton
local bkgMusic = audio.loadSound("Sounds/BKG Music.mp3")

--play audio
audio.play(bkgMusic)





-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "crossFade", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function CharacterSelectionScreenTransition( )
    composer.gotoScene( "character_selection", {effect = "flip", time = 1000})
end    

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function CharacterSelectionScreenFrenchTransition( )
    composer.gotoScene( "character_selectionFrench", {effect = "flip", time = 1000})
end    

-----------------------------------------------------------------------------------------

local function InstructionsTransition( )
    composer.gotoScene( "instructions_screen", {effect = "fromRight", time = 1000})
end

-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsFrenchTransition( )       
    composer.gotoScene( "creditsFrench_screen", {effect = "crossFade", time = 500})
end 

-----------------------------------------------------------------------------------------

local function InstructionsFrenchTransition( )
    composer.gotoScene( "instructionsFrench_screen", {effect = "fromRight", time = 1000})
end

local function FrenchTransition( )
    frenchButton.isVisible = true
    englishButton.isVisible = false
    playButton.isVisible = true
    creditsButton.isVisible = true
    instructionsButton.isVisible = true
    jouerButton.isVisible = false
    creditsFrenchButton.isVisible = false
    instructionsFrenchButton.isVisible = false

end

local function EnglishTransition( )
    englishButton.isVisible = true
    frenchButton.isVisible = false
    playButton.isVisible = false
    creditsButton.isVisible = false
    instructionsButton.isVisible = false
    jouerButton.isVisible = true
    creditsFrenchButton.isVisible = true
    instructionsFrenchButton.isVisible = true
end



local function SoundPause( )
    audio.pause(bkgMusic)
    muteButton.isVisible = false
    unmuteButton.isVisible = true
end

local function SoundUnpause()
    audio.play(bkgMusic)
    muteButton.isVisible = true
    unmuteButton.isVisible = false
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/main_menu.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()



    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

-- Creating Mute Button
    muteButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight*1/5,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/Mute Button Unpressed.png",
            overFile = "Images/Mute Button Pressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = SoundPause
        } )
    
        -----------------------------------------------------------------------------------------   

-- Creating Mute Button
    unmuteButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight*1/5,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/Unmute Button Unpressed.png",
            overFile = "Images/Unmute Button Pressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = SoundUnpause
        } )

---------------------------------------------------------------------------------------------

-- Creating English Button
    englishButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*1/5,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/English Button Unpressed.png",
            overFile = "Images/English Button Pressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = FrenchTransition
        } )

---------------------------------------------------------------------------------------------
-- Creating French Button
    frenchButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*1/5,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/French Button Unpressed.png",
            overFile = "Images/French Button Pressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = EnglishTransition
        } )

---------------------------------------------------------------------------------------------   
-- Creating Jouer Button
    jouerButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*4/8,
            y = display.contentHeight*4/5,
            width = 200,
            height = 100,


            -- Insert the images here
            defaultFile = "Images/Jouer Button Unpressed.png",
            overFile = "Images/Jouer Button Pressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = CharacterSelectionScreenFrenchTransition          
        } )

---------------------------------------------------------------------------------------------   
-- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*4/8,
            y = display.contentHeight*4/5,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/Play Button Unpressed.png",
            overFile = "Images/Play Button Pressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = CharacterSelectionScreenTransition          
        } )
    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight*4/5,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/Credits Button Unpressed.png",
            overFile = "Images/Credits Button Pressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

    -----------------------------------------------------------------------------------------

    -- Creating Credits French Button
    creditsFrenchButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight*4/5,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/Credits Button French Unpressed.png",
            overFile = "Images/Credits Button French Pressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsFrenchTransition
        } ) 

    ----------------------------------------------------------------------------------------- 
    -- Creating Instructions Button
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*4/5,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/Instructions Button Unpressed.png",
            overFile = "Images/Instructions Button Pressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = InstructionsTransition
        } ) 

    -----------------------------------------------------------------------------------------

    -- Creating Instructions French Button
    instructionsFrenchButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*4/5,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/Instructions Button French Unpressed.png",
            overFile = "Images/Instructions Button French Pressed.png",

            -- When the button is released, call the instuctions transition function
            onRelease = InstructionsFrenchTransition
        } ) 

    -----------------------------------------------------------------------------------------



    -- Associating button widgets with this scene
    sceneGroup:insert( jouerButton)
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsFrenchButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsFrenchButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( unmuteButton) 
    sceneGroup:insert( muteButton)
    sceneGroup:insert( englishButton)
    sceneGroup:insert( frenchButton)
    

end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )




-----------------------------------------------------------------------------------------

return scene
