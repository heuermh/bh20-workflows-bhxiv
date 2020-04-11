
## A polyglot workflow for pangenome construction
Pangenomes allow the compact representation and query of many
genomes at once. SARS-CoV2 has been sequenced extensively
since the first weeks of the pandemic, and many full length
genomes have been produced. The creation of a SARS-CoV2 pangenome
from these would provide a valuable community resource that captures
variation across samples and facilitates further research.

### Pangenome generation using minimap2, seqwish, and odgi
[minimap2](https://github.com/lh3/minimap2) is a fast read mapper which can quickly align long reads.
The inputs to pangenome construction are assembled genomes and not reads;
in the case of SARS-CoV2, however, the viral genome is of sufficiently short length
(roughly 30 KB) that whole genomes can be aligned in this manner. The output of
minimap2 is a PAF file, which describes pairwise overlaps between the input sequences.


[seqwish](https://github.com/ekg/seqwish) is a variation graph inducer that can transform overlapped long reads (or genomes)
into a graph representation. It does this by collapsing shared regions between the genomes to 
common sequence while preserving variants between sequences as "bubbles" within the graph. The
details of the algorithm for doing so in a memory- and CPU-efficient manner are described on the
[seqwish GitHub page](https://github.com/ekg/seqwish).

Seqwish outputs a graph in GFA format. The next step in the workflow uses [odgi](https://github.com/vgteam/odgi) to convert the
graph to a succinct, indexed format that can be queried. It then builds a simple visualization of
the graph that shows the paths of the various genomes. This graph is accessible via the handlegraph
API, meaning it is compatible with a number of pangenome-oriented tools.

### Many hands, many languages
The workflow group packaged the pangenome construction workflow into three common workflow languages:
CWL, Galaxy, NextFlow, and WDL. All of these provide interfaces to run locally as well as in the cloud and
use Docker for environment management. By having the same workflow in three workflow languages, we
have both provided a pangenome construction resource to multiple communities and facilitating language
learning.
