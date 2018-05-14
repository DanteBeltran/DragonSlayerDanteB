-----------------------------------------------------------------------------------------
--
-- instructions_screen.lua
-- Created by: Dante B
-- Special thanks to Wal Wal for helping in the design of this framework.
-- Date: 2018-04-10
-- Description: This is the instruction page, displaying a back button to the main menu.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "character_selection"

-- Creating Scene Object
scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkg_image
local backButton
local danteButton
local hudaButton
local lorenzoButton
local ethanButton

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "zoomOutInFadeRotate", time = 500})
end

-- Creating Transitioning Function to Level 1 Screen
local function Level1ScreenTransition()
    composer.gotoScene( "level1_screen", {effect = "zoomOutInFadeRotate", time = 500})
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImageRect("Images/Character Selection Screen.png", display.contentWidth, display.contentHeight)
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

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*15/16,

        -- Setting Dimensions
        -- width = 1000,
        -- height = 106,

        -- Setting Visual Properties
        defaultFile = "Images/Back Button Unpressed.png",
        overFile = "Images/Back Button Pressed.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    --------------------------------------------------------------------------------------------

    -- Creating Dante Button
    danteButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1.2/8,
        y = display.contentHeight*11.4/16,
        width = 200,
        height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/Dante Button Unpressed.png",
        overFile = "Images/Dante Button Pressed.png",

        -- Setting Functional Properties
        onRelease = Level1ScreenTransition

    } )

        -----------------------------------------------------------------------------------------

    -- Creating Huda Button
    hudaButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*3/8,
        y = display.contentHeight*11.4/16,
        width = 200,
        height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/Huda Button Unpressed.png",
        overFile = "Images/Huda Button Pressed.png",

        -- Setting Functional Properties
        onRelease = Level1ScreenTransition

    } )

        -----------------------------------------------------------------------------------------

    -- Creating Lorenzo Button
    lorenzoButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*5/8,
        y = display.contentHeight*11.4/16,
        width = 200,
        height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/Lorenzo Button Unpressed.png",
        overFile = "Images/Lorenzo Button Pressed.png",

        -- Setting Functional Properties
        onRelease = Level1ScreenTransition

    } )

    -----------------------------------------------------------------------------------------

    -- Creating Ethan Button
    ethanButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*7/8,
        y = display.contentHeight*11.4/16,
        width = 200,
        height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/Ethan Button Unpressed.png",
        overFile = "Images/Ethan Button Pressed.png",

        -- Setting Functional Properties
        onRelease = Level1ScreenTransition

    } )

    -----------------------------------------------------------------------------------------

    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )
    sceneGroup:insert( danteButton )
    sceneGroup:insert( hudaButton )
    sceneGroup:insert( lorenzoButton )
    sceneGroup:insert( ethanButton )
    
end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
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

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end --function scene:destroy( event )

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


