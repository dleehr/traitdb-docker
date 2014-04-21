# -*- sh -*-
FROM dleehr/traitdb

MAINTAINER Dan Leehr dan.leehr@nescent.org

# copy the delayed job worker script
ADD scripts/worker /worker
USER rails
CMD /worker