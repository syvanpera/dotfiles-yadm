#!/usr/bin/env python

import json
import urllib
import urllib.parse
import urllib.request
import os


def main():
    city = "Vantaa"
    api_key = "38ca4ad757d43fc6134dfee30c4ec018"
    icon_to_glyph = {
        "01d": " ",
        "01n": " ",
        "02d": " ",
        "02n": " ",
        "03d": " ",
        "03n": " ",
        "04d": " ",
        "04n": " ",
        "09d": " ",
        "09n": " ",
        "10d": " ",
        "10n": " ",
        "11d": " ",
        "11n": " ",
        "13d": " ",
        "13n": " ",
        "50d": " ",
        "50n": " ",
    }

    try:
        data = urllib.parse.urlencode({'q': city, 'appid': api_key, 'units': 'metric'})
        weather = json.loads(urllib.request.urlopen(
            'http://api.openweathermap.org/data/2.5/weather?' + data)
            .read())
        city = weather['name']
        desc = weather['weather'][0]['description'].capitalize()
        icon = weather['weather'][0]['icon']
        temp = int(float(weather['main']['temp']))
        return '{} {}°C - {}'.format(icon_to_glyph[icon], temp, city)
        # return '{}°C'.format(temp)
    except:
        return ''


if __name__ == "__main__":
	print(main())
