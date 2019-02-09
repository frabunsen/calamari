#!/bin/bash

# Need python pyperclip package (pip install pyperclip)
# Need python fpdf package (pip install pyperclip)

python <(cat <<EoF

import os
import sys
import glob
import pyperclip
from fpdf import FPDF
NAME = "~/OUTPDF-"
pdfs = glob.glob(NAME + "*.pdf")
num = len(pdfs) + 1
OUTPDF = "".join([NAME,str(num),".pdf"])
pdf = FPDF()
pdf.add_page()
pdf.set_xy(0, 0)
pdf.set_font("helvetica", "", 10.0)
pdf.multi_cell(0, 5, txt=pyperclip.paste())
pdf.output(OUTPDF, "F")

EoF
)
