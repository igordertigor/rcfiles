#!/usr/bin/env python3

import json
import subprocess
import sys
import os


class Packages(object):

    def __init__(self, config):
        self.config = config

    @property
    def all_topics(self):
        t = list(self.config.keys())
        t.pop(t.index('dependencies'))
        return tuple(t)

    def prepare_for_installation(self, topic):
        (CfgList(self.config[topic])
            .filter(lambda pkg: pkg in self.config['dependencies'])
            .map(lambda pkg: self.config['dependencies'][pkg])
            .map(run_script))

    def install_packages(self, topic):
        cmd = 'apt-get install -y {}'.format(' '.join(self.config[topic]))
        run_script(cmd)


class CfgList(list):

    def filter(self, func):
        return CfgList(x for x in self if func(x))

    def map(self, func):
        return CfgList(func(x) for x in self)


def is_root():
    return os.geteuid() == 0


def run_script(code):
    if is_root():
        subprocess.run(code, shell=True)
    else:
        print('# Not running with sudo -- just printing what I would do')
        print(code)


if __name__ == '__main__':
    with open("expected_packages.json") as f:
        pkg = Packages(json.load(f))

    topics = sys.argv[1:]

    if len(topics) == 1 and topics[0] == 'all':
        topics = pkg.all_topics
    elif len(topics) == 0:
        print("No topics chosen. Available topics are:\n  {}"
              .format(pkg.all_topics))

    for topic in topics:
        pkg.prepare_for_installation(topic)
        pkg.install_packages(topic)
