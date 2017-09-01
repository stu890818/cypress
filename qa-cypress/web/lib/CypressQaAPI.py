#!/usr/bin/python
import ast
import json
import os
import requests
import sys
from exceptions import AssertionError
from robot.libraries.BuiltIn import BuiltIn


class CypressQaAPI(object):

    def __init__(self):
        try:
            self.BuiltIn = BuiltIn()
            self.HOST = self.BuiltIn.get_variable_value('${CYPRESS_QA_URL}')
        except:
            print('import BuiltIn failed')

        self.SESSION = requests.Session()
        self.TOKEN = None
        self.SESSION.headers = {
            "Content-Type": "application/x-www-form-urlencoded",
            'accept': 'application/x-www-form-urlencoded'
        }

    def __request(self, method, append='', **kwargs):
        print 'https://{self.HOST}/api:1{append}'.format(**locals())
        resp = self.SESSION.request(
            method, 'https://{self.HOST}/api:1{append}'.format(**locals()), **kwargs)
        return resp

    def __resp_json(self, resp):
        try:
            return resp.json()
        except (ValueError, KeyError, TypeError) as e:
            print("Convert Json To Object Failed: {e}".format(**locals()))
        return resp.content

    def __headers(self, token=None):
        if token is None:
            if self.TOKEN is None:
                self.TOKEN = self.BuiltIn.run_keyword('ExoYeti.get_user_token')
            token = self.TOKEN
        self.SESSION.headers.update(
            {'Authorization': 'token {token}'.format(**locals())})

# -------------------------------------------