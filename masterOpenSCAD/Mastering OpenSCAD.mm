<map version="freeplane 1.11.5">
<!--To view this file, download free mind mapping software Freeplane from https://www.freeplane.org -->
<node TEXT="Mastering OpenSCAD&#xa;(by Jochen Kerdels)" LOCALIZED_STYLE_REF="AutomaticLayout.level.root" FOLDED="false" ID="ID_1090958577" CREATED="1409300609620" MODIFIED="1695422071506">
<hook NAME="accessories/plugins/AutomaticLayout.properties" VALUE="ALL"/>
<font BOLD="true"/>
<hook NAME="MapStyle" background="#f9f9f8" zoom="1.001">
    <properties show_icon_for_attributes="true" edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" show_note_icons="true" associatedTemplateLocation="template:/light_nord_template.mm" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ID="ID_506805493" ICON_SIZE="12 pt" FORMAT_AS_HYPERLINK="false" COLOR="#484747" BACKGROUND_COLOR="#efefef" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="8 pt" SHAPE_VERTICAL_MARGIN="5 pt" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1.9 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#8fbcbb" BORDER_DASH_LIKE_EDGE="true" BORDER_DASH="SOLID">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" DASH="" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_506805493" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<font NAME="SansSerif" SIZE="11" BOLD="false" STRIKETHROUGH="false" ITALIC="false"/>
<edge STYLE="bezier" COLOR="#2e3440" WIDTH="3" DASH="SOLID"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/auto"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/auto"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details" COLOR="#ffffff" BACKGROUND_COLOR="#2e3440" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1.9 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#f0f0f0" BORDER_DASH_LIKE_EDGE="true">
<font SIZE="11" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#f6f9a1" TEXT_ALIGN="LEFT">
<icon BUILTIN="clock2"/>
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.selection" COLOR="#eceff4" BACKGROUND_COLOR="#bf616a" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#bf616a"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.important" ID="ID_915433779" BORDER_COLOR="#bf616a">
<icon BUILTIN="yes"/>
<arrowlink COLOR="#bf616a" TRANSPARENCY="255" DESTINATION="ID_915433779"/>
<font NAME="Ubuntu" SIZE="14"/>
<edge COLOR="#bf616a"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#ffffff" BACKGROUND_COLOR="#484747" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="10 pt" SHAPE_VERTICAL_MARGIN="10 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#eceff4" BACKGROUND_COLOR="#d08770" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="8 pt" SHAPE_VERTICAL_MARGIN="5 pt">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#3b4252" BACKGROUND_COLOR="#ebcb8b">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#2e3440" BACKGROUND_COLOR="#a3be8c">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#2e3440" BACKGROUND_COLOR="#b48ead">
<font SIZE="11"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5" COLOR="#e5e9f0" BACKGROUND_COLOR="#5e81ac">
<font SIZE="11"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6" BACKGROUND_COLOR="#81a1c1">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7" BACKGROUND_COLOR="#88c0d0">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8" BACKGROUND_COLOR="#8fbcbb">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9" BACKGROUND_COLOR="#d8dee9">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10" BACKGROUND_COLOR="#e5e9f0">
<font SIZE="9"/>
</stylenode>
</stylenode>
</stylenode>
</map_styles>
</hook>
<node TEXT="00 Basics" POSITION="bottom_or_right" ID="ID_1083787365" CREATED="1695054748984" MODIFIED="1695054752921">
<node TEXT="00-01 Basic Building Blocks" ID="ID_1164868980" CREATED="1695054825575" MODIFIED="1695054836322"/>
<node TEXT="00-02 Transformation, Boolean, Loops" ID="ID_955225437" CREATED="1695054836680" MODIFIED="1695054858233"/>
<node TEXT="00-03 Modules, Conditional Description" ID="ID_1231675346" CREATED="1695054858592" MODIFIED="1695054873521"/>
</node>
<node TEXT="01 Shelf Bracket" POSITION="bottom_or_right" ID="ID_922279565" CREATED="1695054753824" MODIFIED="1695054769155">
<node TEXT="Union" ID="ID_1530153022" CREATED="1695253523153" MODIFIED="1695253527839"/>
<node TEXT="Math functions (e.g. root, power and arc cosine)" ID="ID_1405460313" CREATED="1695253530326" MODIFIED="1695253549793"/>
<node TEXT="Projection function" ID="ID_1013226724" CREATED="1695253530470" MODIFIED="1695253562817"/>
</node>
<node TEXT="02 Wall Anchor" POSITION="bottom_or_right" ID="ID_1990743051" CREATED="1695054769536" MODIFIED="1695054774008">
<node TEXT="2D Shape: square, circle" POSITION="bottom_or_right" ID="ID_761505045" CREATED="1695253603370" MODIFIED="1695253638341"/>
<node TEXT="2D to 3D: linear_extrude, also rotate_extrude" ID="ID_241854062" CREATED="1695253574542" MODIFIED="1695253601641"/>
<node TEXT="3D rotate transformation on cylinder" ID="ID_1169279433" CREATED="1695253645088" MODIFIED="1695253660275"/>
<node TEXT="Function" ID="ID_1474978156" CREATED="1695253662943" MODIFIED="1695253668211"/>
</node>
<node TEXT="03 Window Stopper" POSITION="bottom_or_right" ID="ID_299703912" CREATED="1695054774159" MODIFIED="1695054778225">
<node TEXT="for-loop with generative for" ID="ID_1797671311" CREATED="1695253674255" MODIFIED="1695253691797"/>
<node TEXT="keyword: let" ID="ID_1427446846" CREATED="1695253693968" MODIFIED="1695253704293"/>
<node TEXT="2D Shape: polygon" ID="ID_1870842119" CREATED="1695253705242" MODIFIED="1695253717587"/>
</node>
<node TEXT="04 Clock Movement Mockup" POSITION="bottom_or_right" ID="ID_1410236498" CREATED="1695054778759" MODIFIED="1695054784938">
<node TEXT="2D shape import" ID="ID_742241731" CREATED="1695253928065" MODIFIED="1695253942380"/>
<node TEXT="3D shape surface" ID="ID_385254707" CREATED="1695253942993" MODIFIED="1695253948319"/>
<node TEXT="Transformation: mirror, resize" ID="ID_1615463031" CREATED="1695253950318" MODIFIED="1695253958216"/>
<node TEXT="Animations" ID="ID_698484431" CREATED="1695253958793" MODIFIED="1695253966368"/>
</node>
<node TEXT="05 Pen Holder" POSITION="bottom_or_right" ID="ID_1391782252" CREATED="1695054785095" MODIFIED="1695054788680">
<node TEXT="Rotate Extrusion" ID="ID_334543817" CREATED="1695407502630" MODIFIED="1695407510948"/>
<node TEXT="Exploratory design approach" ID="ID_259394715" CREATED="1695407519718" MODIFIED="1695407529271"/>
</node>
<node TEXT="06 Stamp" POSITION="bottom_or_right" ID="ID_148153666" CREATED="1695054788840" MODIFIED="1695054791946">
<node TEXT="2D Text" ID="ID_1513759764" CREATED="1695416522573" MODIFIED="1695416527850"/>
<node TEXT="Boolean Intersection" ID="ID_1884047516" CREATED="1695416539755" MODIFIED="1695416547660"/>
<node TEXT="Projection Transformation" ID="ID_519858717" CREATED="1695416548995" MODIFIED="1695416557484"/>
<node TEXT="Offset" ID="ID_1335260655" CREATED="1695416559817" MODIFIED="1695416562849"/>
<node TEXT="Minkowski" ID="ID_536598554" CREATED="1695416562995" MODIFIED="1695416569908"/>
<node TEXT="Operate OpenSCAD in command line" ID="ID_1894044775" CREATED="1695416574090" MODIFIED="1695416586620"/>
</node>
<node TEXT="07 Flame Sculpture" POSITION="bottom_or_right" ID="ID_1533298755" CREATED="1695054792247" MODIFIED="1695054797985"/>
<node TEXT="08 Recursive Tree" POSITION="bottom_or_right" ID="ID_643478340" CREATED="1695054798158" MODIFIED="1695054802640"/>
<node TEXT="09 Parabolic Reflector" POSITION="bottom_or_right" ID="ID_27902417" CREATED="1695054802792" MODIFIED="1695054811371"/>
<node TEXT="10 Fan Wheel" POSITION="bottom_or_right" ID="ID_1643482969" CREATED="1695054811527" MODIFIED="1695054815040"/>
<node TEXT="11 More..." POSITION="bottom_or_right" ID="ID_1931092576" CREATED="1695054815367" MODIFIED="1695054818298"/>
</node>
</map>
