#!/usr/bin/python
import re, subprocess

local = {
  'all':       '[Gmail]/All Mail',
  'drafts':    '[Gmail]/Drafts',
  'important': '[Gmail]/Important',
  'sent':      '[Gmail]/Sent Mail',
  'spam':      '[Gmail]/Spam',
  'starred':   '[Gmail]/Starred',
  'trash':     '[Gmail]/Trash'
}

remote = { v:k for k, v in local.items() }
filters = [local[key] for key in ['important', 'spam', 'trash']]

def filter_remote_gmail(folder):
  return folder not in filters


def trans_local_gmail(folder):
  return local.get(folder, folder)

def trans_remote_gmail(folder):
  return remote.get(folder, folder)

def get_keychain_pass(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command': 'find-internet-password',
        'account': account,
        'server': server,
        'keychain': '/Users/tarn/Library/Keychains/login.keychain',
    }
    command = "sudo -u tarn %(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
               if l.startswith('password: ')][0]

    return re.match(r'password: "(.*)"', outtext).group(1)
