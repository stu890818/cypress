#!/usr/bin/python
import ast
import json
import os
import requests
import sys
import uuid
# import datatime
# from datetime import datetime
from exceptions import AssertionError
from robot.libraries.BuiltIn import BuiltIn

import logging
# These two lines enable debugging at httplib level (requests->urllib3->http.client)
# You will see the REQUEST, including HEADERS and DATA, and RESPONSE with HEADERS but without DATA.
# The only thing missing will be the response.body which is not logged.
try:
   import http.client as http_client
except ImportError:
   # Python 2
   import httplib as http_client
http_client.HTTPConnection.debuglevel = 1
# You must initialize logging, otherwise you'll not see debug output.
logging.basicConfig()
logging.getLogger().setLevel(logging.DEBUG)
requests_log = logging.getLogger("requests.packages.urllib3")
requests_log.setLevel(logging.DEBUG)
requests_log.propagate = True


class CypressQaAPI(object):

    def __init__(self):
        try:
            self.BuiltIn = BuiltIn()
            self.HOST = self.BuiltIn.get_variable_value('${CYPRESS_QA_API_URL}')
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
        player = "account={}&password={}&nickname={}".format(account, password, nickname)
        resp = self.__request(
            'post', "gameboy/player".format(**locals()), data=player)
        return resp

    def gameboy_player_login_post(self, account, password, nickname, token=None):
        self.__headers(token)
        player = "account={}&password={}&nickname={}".format(account, password, nickname)
        resp = self.__request(
            'post', "gameboy/player/login".format(**locals()), data=player)
        return resp

    def gameboy_player_gamelink_post(self, usertoken, gamehall, gametech, gameplat, gamecode, gametype, lang, token=None):
        self.__headers(token)
        player = "usertoken={}&gamehall={}&gametech={}&gameplat={}&gamecode={}&gametype={}&lang={}".format(usertoken, gamehall, gametech, gameplat, gamecode, gametype, lang)
        resp = self.__request(
            'post', "gameboy/player/gamelink".format(**locals()), data=player)
        return resp

    def gameboy_player_deposit_post(self, amount, account, token=None):
        self.__headers(token)
        mtcode = uuid.uuid4()
        eventTime = '2017-06-27T17%3A34%3A41%2B08%3A00'
        # utc_now = datetime.now(utc)
        # eventTime = (utc_now.isoformat('T'))
        player = "mtcode={}&amount={}&eventTime={}&account={}".format(mtcode, amount, eventTime, account)
        print player
        resp = self.__request(
            'post', "gameboy/player/deposit".format(**locals()), data=player)
        return resp     




