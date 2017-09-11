#!/usr/bin/python
import ast
import json
import os
import requests
import sys
import uuid
from exceptions import AssertionError
from robot.libraries.BuiltIn import BuiltIn

class CypressQaAPI(object):

    def __init__(self):
        try:
            self.BuiltIn = BuiltIn()
            self.HOST = self.BuiltIn.get_variable_value(
                '${CYPRESS_QA_API_URL}')
        except:
            print('import BuiltIn failed')

        self.SESSION = requests.Session()
        self.TOKEN = None
        self.SESSION.headers = {
            "Content-Type": "application/x-www-form-urlencoded",
            'accept': 'application/x-www-form-urlencoded'
        }

    def __request(self, method, append='', **kwargs):
        resp = self.SESSION.request(
            method, '{self.HOST}/{append}'.format(**locals()), **kwargs)
        return resp

    def __headers(self, token=None):
        if self.TOKEN is None:
            if token is None:
                print 'Authorization should not be none.'
            else:
                self.TOKEN = token
        self.SESSION.headers.update({
            'authorization': '%s' % self.TOKEN
        })

# -------------------------------------------

    def gameboy_player_post(self, account, password, nickname, token=None):
        self.__headers(token)
        player = "account={}&password={}&nickname={}".format(
            account, password, nickname)
        resp = self.__request(
            'post', "gameboy/player".format(**locals()), data=player)
        return resp

    def gameboy_player_login_post(self, account, password, nickname, token=None):
        self.__headers(token)
        player = "account={}&password={}&nickname={}".format(
            account, password, nickname)
        resp = self.__request(
            'post', "gameboy/player/login".format(**locals()), data=player)
        return resp

    def gameboy_player_gamelink_post(self, usertoken, gamehall, gametech, gameplat, gamecode, gametype, lang, token=None):
        self.__headers(token)
        player = "usertoken={}&gamehall={}&gametech={}&gameplat={}&gamecode={}&gametype={}&lang={}".format(
            usertoken, gamehall, gametech, gameplat, gamecode, gametype, lang)
        resp = self.__request(
            'post', "gameboy/player/gamelink".format(**locals()), data=player)
        return resp

    def gameboy_player_deposit_post(self, amount, account, token=None):
        self.__headers(token)
        mtcode = uuid.uuid4()
        eventTime = '2017-06-27T17%3A34%3A41%2B08%3A00'
        player = "mtcode={}&amount={}&eventTime={}&account={}".format(
            mtcode, amount, eventTime, account)
        resp = self.__request(
            'post', "gameboy/player/deposit".format(**locals()), data=player)
        return resp

    def gameboy_player_withdraw_post(self, amount, account, token=None):
        self.__headers(token)
        mtcode = uuid.uuid4()
        eventTime = '2017-06-27T17%3A34%3A41%2B08%3A00'
        player = "mtcode={}&amount={}&eventTime={}&account={}".format(
            mtcode, amount, eventTime, account)
        resp = self.__request(
            'post', "gameboy/player/withdraw".format(**locals()), data=player)
        return resp
