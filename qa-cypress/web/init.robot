*** Settings ***
Library           BuiltIn
Library           Collections
Library           ImapLibrary
Library           OperatingSystem
Library           Process
Library           RequestsLibrary
Library           Selenium2Library    30    10
Library           BuiltIn
Library           String
# Library           SikuliLibrary

Resource          ../web/lib/keywords_common.robot
Resource          ../web/lib/keywords_login_page.robot
Resource          ../web/lib/keywords_player_history.robot
Resource          ../web/lib/keywords_logout_page.robot
Resource          ../web/lib/keywords_cs_create.robot
Resource          ../web/lib/keywords_cs_list.robot
Resource          ../web/lib/CypressQaAPI.py

Variables         ../setting.py
