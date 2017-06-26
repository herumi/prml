if /i "%1"=="public" (
	set src=main-pub
) else (
	set src=main
)
for %%x in (*.jpg *.png) do extractbb %%x
rem for %%x in (prml0 prml1 prml2 prml3 prml4 prml5 prml9 prml10 prml11) do python add_idx.py %%x.tex
perl book-index.pl
platex %src%.tex
mendex -g -U %src%.idx
platex %src%.tex
mendex -g -U %src%.idx
platex %src%.tex
mendex -g -U %src%.idx
platex %src%.tex
dvipdfmx %src%.dvi
