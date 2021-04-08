FROM python:2

# Download and install Python packages into virtualenv
#
RUN virtualenv /usr/local/zope/Zope-2.13
WORKDIR /usr/local/zope/Zope-2.13
# psycopg2
RUN ./bin/pip install --no-cache-dir psycopg2-binary
# PyJWT
RUN ./bin/pip install --no-cache-dir pyjwt
# 4Suite-XML (needs manual build)
RUN wget https://pypi.python.org/packages/source/4/4Suite-XML/4Suite-XML-1.0.2.tar.bz2 && \
  tar xjvf 4Suite-XML-1.0.2.tar.bz2 && \
  cd 4Suite-XML-1.0.2 && \
  ../bin/python setup.py install && \
  cd .. && \
  rm -r 4Suite-XML-1.0.2.tar.bz2 4Suite-XML-1.0.2
# Amara (depends on 4suite-xml)
RUN ./bin/pip install --no-cache-dir 'Amara==1.2.0.2'
# httplib2
RUN ./bin/pip install --no-cache-dir httplib2

# Install Zope and packages
#
RUN ./bin/pip install --no-cache-dir \
 --no-binary zc.recipe.egg \
 -r https://zopefoundation.github.io/Zope/releases/2.13.30/requirements.txt
# ZSQLMethods
RUN ./bin/pip install --no-cache-dir 'Products.ZSQLMethods<3.0' 
# ZPsycopgDA (needs matching ZPsycopgDA in instance Products folder)
RUN cd /tmp && \
    wget 'https://github.com/psycopg/ZPsycopgDA/archive/master.zip' && \
    unzip master.zip && \
    /usr/local/zope/Zope-2.13/bin/pip install --no-cache-dir /tmp/ZPsycopgDA-master

# create zope user
RUN groupadd -r --gid 1000 zope && useradd --no-log-init -r -g zope --uid 1000 zope

WORKDIR /usr/local/zope
EXPOSE 8080

# mount your own Zope instance into /usr/local/zope and run its runzope as CMD
RUN mkdir ZopeInstance
RUN chown zope ZopeInstance
USER zope

# creazione istanza a partire da Zope-2.13, copia di zpsycopg nell'istanza e avvio istanza
# RUN /usr/local/zope/Zope-2.13/bin/mkzopeinstance -d /usr/local/zope/ZopeInstance -u admin:admin
# RUN cp -r /tmp/ZPsycopgDA-master/ZPsycopgDA /usr/local/zope/ZopeInstance/Products
# RUN ZopeInstance/bin/zopectl start



