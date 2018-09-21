#!/usr/bin/env python
from dol import Dol
import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('dol_file', type=str)
    args = parser.parse_args()

    dolphin = Dol(open(args.dol_file, 'rb'))

    print dolphin


if __name__ == '__main__':
    main()
