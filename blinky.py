from argparse import ArgumentParser

from blinkstick import blinkstick


class Blinky:
    def __init__(self):
        self.led_strip = blinkstick.find_first()

    @property
    def led_count(self):
        return self.led_strip.get_led_count()

    def all(self, hex_color):
        self.set_range(0, self.led_count, hex_color)

    @property
    def status(self):
        return self.led_strip.get_color(color_format='hex')

    def set_range(self, start, end, hex_color):
        for i in range(start, end):
            self.led_strip.set_color(index=i, hex=hex_color)

    def off(self, index=None):
        self.set_range(0, self.led_count, None)


def main():
    argparser = ArgumentParser()
    argparser.add_argument('--status', default=False, action='store_true')
    argparser.add_argument('--on', default=False, action='store_true')
    argparser.add_argument('--off', default=False, action='store_true')
    argparser.add_argument('--color', default='#E6DB74', action='store')
    options = argparser.parse_args()

    blinky = Blinky()

    if options.status:
        print(blinky.status)
        return

    if options.off:
        blinky.off()
        return

    if options.on or options.color:
        blinky.all(options.color)


main()
