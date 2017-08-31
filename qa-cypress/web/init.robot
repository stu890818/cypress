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

Resource          ../web/lib/keywords_common.robot

Variables         ../setting.py
