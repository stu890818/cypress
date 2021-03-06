*** Settings ***
Library           BuiltIn
Library           Collections
Library           ImapLibrary
Library           OperatingSystem
Library           Process
Library           RequestsLibrary
Library           Selenium2Library
Library           String
Library           SikuliLibrary
Library           Screenshot
Library           ../web/lib/CypressQaAPI.py

Resource          ../web/lib/keywords_common.robot
Resource          ../web/lib/keywords_login_page.robot
Resource          ../web/lib/keywords_logout_page.robot
Resource          ../web/lib/keywords_dashboard_createAgent.robot
Resource          ../web/lib/keywords_dashboard_agentList.robot
Resource          ../web/lib/keywords_parent_parents.robot
Resource          ../web/lib/keywords_parent_players.robot
Resource          ../web/lib/keywords_player_order.robot
Resource          ../web/lib/keywords_player_record.robot
Resource          ../web/lib/keywords_report_finance.robot

Variables         ../setting.py
