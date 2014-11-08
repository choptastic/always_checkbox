%% vim: ts=4 sw=4 et
-module (always_checkbox).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
    reflect/0,
    transform_element/1
]).

reflect() -> record_info(fields, always_checkbox).

transform_element(#always_checkbox{class=Class, actions=Actions,
        wrapper_id=WrapperID, id=ID, html_id=HtmlID, postback_id=PostbackID,
        yes_value=Yes, no_value=No, checked=Checked}) ->

    CheckJS = wf:f("obj('~s').value = (obj('me').checked ? '~s' : '~s');",
                   [PostbackID, wf:js_escape(Yes), wf:js_escape(No)]),

    #panel{
        id=WrapperID,
        class=[always_checkbox, Class],
        html_id=HtmlID,
        body=[
            #hidden{id=PostbackID, text=?WF_IF(Checked, Yes, No)},
            #checkbox{id=ID, checked=Checked, actions=[
                #event{type=click, actions=CheckJS},
                Actions
            ]}
        ]
    }.
