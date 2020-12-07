from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

import numpy as np

extensions=[Extension("cython_module",["cython_module.pyx"],include_dirs=[np.get_include()])]

setup(
    cmdclass={'build_ext':build_ext},
    ext_modules = extensions
)