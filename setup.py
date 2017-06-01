
"""
An interface to a WSDB.
Almost all of this would not have been possible without Sergey Koposov.
"""

import sys
from setuptools import setup
from codecs import open
from os import path
from re import compile as re_compile

def read(filename):
    kwds = {"encoding": "utf-8"} if sys.version_info[0] >= 3 else {}
    with open(filename, **kwds) as fp:
        contents = fp.read()
    return contents

# Get the version information.
here = path.abspath(path.dirname(__file__))
vre = re_compile("__version__ = \"(.*?)\"")
version = vre.findall(read(path.join(here, "wsdb", "__init__.py")))[0]

setup(
    name="wsdb",
    version=version,
    author="Andrew R. Casey",
    author_email="andrew.casey@monash.edu",
    description="Interface to a World Sky Database",
    long_description=read(path.join(here, "README.md")),
    license="MIT",
    classifiers=[
        "Intended Audience :: Science/Research",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 2.7",
        "Programming Language :: Python :: 3.6",
        "Topic :: Scientific/Engineering :: Astronomy",
        "Topic :: Scientific/Engineering :: Physics"
    ],
    keywords="GOTO WSDB",
    packages=["wsdb"],
    install_requires=["psycopg2", "astropy", "numpy"],
    extras_require={
        "test": ["coverage"]
    },
    package_data={
        "": ["LICENSE"],
    },
    include_package_data=True,
    data_files=None
)
