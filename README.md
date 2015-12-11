L. Trudeau, [Detection and concealment of visual degradation resulting from erroneous H.264
sequences](https://www.sharelatex.com/github/repos/luctrudeau/MastersThesis/builds/latest/output.pdf). Master’s thesis, École de technologie supérieure université du Québec, 2011. [![PDF Status](https://www.sharelatex.com/github/repos/luctrudeau/MastersThesis/builds/latest/badge.svg)](https://www.sharelatex.com/github/repos/luctrudeau/MastersThesis/builds/latest/output.pdf) [![BY NC ND](https://licensebuttons.net/l/by-nc-nd/3.0/88x31.png)](https://creativecommons.org/licenses/by-nc-nd/2.0/ca/)

## BibTeX
```
@phdthesis{Trudeau2011,
  author = {Trudeau, L.},
  school = {École de technologie supérieure université du Québec},
  title = {Detection and concealment of visual degradation resulting from erroneous H.264 sequences},
  type = {Master's Thesis},
  url = {http://espace.etsmtl.ca/896/1/TRUDEAU\_Luc.pdf},
  year = {2011}
}
```

## Abstract
> In mobile video applications, where unreliable networks are commonplace, corrupted video
packets can have a profound impact on the quality of the user experience. Error resilient
mechanisms like retransmission and redundant frames may impose an unacceptable burden
on mobile networks. In these cases a decoder-based error resilience approach, like the one
described in this work, can help improve the end-user experience without adding load to the
network.
In this master’s thesis, we show that, in a wide range of operating conditions, selectively
reusing data resulting from decodable broken packets leads to better results than frame copy.
This selection is guided by a novel concept that combines motion estimation and a measure
of blocking artefacts at block edges to predict visual degradation caused by the decoding of
erroneous packets.
The proposed solution was tested against 17, H.264 coded, QCIF sequence with quantization
parameters from 16 to 28 and exposed to bit error rates of 0.0004 to 0.0032. Simulation
results show that the probability of successfully decoding a broken sequence varies from
20 % to 70 % (depending on operating conditions). Combined with the proposed solution, the
H.264/AVC JM reference software decoder can select the best option between frame copy and
the erroneous frame decoding in 81 % to 86 % and 88 % to 91 % of the test cases (depending
on operating conditions). We also obtain an average gain of 0.65 dB to 0.86 dB (depending on
operating conditions).
