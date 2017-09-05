*** Settings ***
Library           BuiltIn
Library           Collections
Library           ImapLibrary
Library           OperatingSystem
Library           Process
Library           RequestsLibrary
Library           Selenium2Library
Library           BuiltIn
Library           String
Library           SikuliLibrary
Library           ImageHorizonLibrary
Library           ../web/lib/CypressQaAPI.py
Library           Screenshot

Resource          ../web/lib/keywords_common.robot
Resource          ../web/lib/keywords_login_page.robot
Resource          ../web/lib/keywords_logout_page.robot
Resource          ../web/lib/keywords_parent_create.robot
Resource          ../web/lib/keywords_parent_players.robot
Resource          ../web/lib/keywords_parent_list_parentinfo.robot
Resource          ../web/lib/keywords_player_order.robot
Resource          ../web/lib/keywords_player_record.robot

Variables         ../setting.py
