#!/usr/bin/env python3

import sys
from email.parser import Parser as EmailParser
from email.policy import default
from html.parser import HTMLParser


class LinkParser(HTMLParser):

    def __init__(self):
        super(LinkParser, self).__init__()
        self.links = []
        self.current_label = ''
        self.current_href = ''
        self.isopen = False

    def handle_starttag(self, tag, attrs):
        if tag == 'a':
            self.isopen = True
            attrs = dict(attrs)
            if 'href' in attrs:
                self.current_href += attrs['href']

    def handle_endtag(self, tag):
        if tag == 'a':
            self.isopen = False
            self.links.append((self.current_label, self.current_href))
            self.current_label = ''
            self.current_href = ''

    def handle_data(self, data):
        if self.isopen:
            self.current_label += data


def process_email(txt):
    mail = EmailParser(policy=default).parsestr(txt)
    body = mail.get_body()
    try:
        return body.get_content()
    except KeyError:
        for i in body.walk():
            if i.get_content_subtype() == 'html':
                return i.get_content()


def get_links(html):
    parser = LinkParser()
    parser.feed(html)
    return parser.links


if __name__ == '__main__':
    links = get_links(process_email(sys.stdin.read()))

    for l in links:
        print('{:60s}: {}'.format(*l))
