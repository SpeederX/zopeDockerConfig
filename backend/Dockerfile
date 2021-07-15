FROM python:2

# Download and install Python packages into virtualenv
#
RUN virtualenv /usr/local/zope/Zope-2.13
WORKDIR /usr/local/zope/Zope-2.13

# psycopg2
RUN ./bin/pip install --no-cache-dir psycopg2-binary

# PyJWT
RUN ./bin/pip install --no-cache-dir pyjwt

# SQLAutoCode for SQLAlchemy structure acquisition
RUN ./bin/pip install sqlautocode

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
RUN ./bin/pip install --no-cache-dir \
 --no-binary zc.recipe.egg \
 -r https://zopefoundation.github.io/Zope/releases/2.13.30/requirements.txt

# ZSQLMethods
RUN ./bin/pip install --no-cache-dir 'Products.ZSQLMethods<3.0'

# SQLAlchemyDA 0.6.2b1 requirements sqlalchemy e z3c.sqlalchemy
RUN ./bin/pip install SQLAlchemy==0.7.1 zope.sqlalchemy==0.7.1 z3c.sqlalchemy==1.4.0 RelStorage==1.5.0

#RUN ./bin/python2.7 ./lib/python2.7/site-packages/setup.py install

# Getting SQLAlchemy and
# ZPsycopgDA (needs matching ZPsycopgDA in instance Products folder)
WORKDIR /tmp
RUN wget 'https://github.com/psycopg/ZPsycopgDA/archive/master.zip' && \
    unzip master.zip && \
    wget 'https://github.com/zopefoundation/Products.SQLAlchemyDA/archive/refs/tags/0.6.0b.zip' && \
    unzip 0.6.0b.zip
    #  && \
#    wget "https://github.com/zopefoundation/z3c.sqlalchemy/archive/refs/heads/1.3.zip" && \
#    unzip 1.3.zip
WORKDIR /usr/local/zope/Zope-2.13
RUN ./bin/pip install --no-cache-dir /tmp/ZPsycopgDA-master
# && \
#    cd /tmp/z3c.sqlalchemy-1.3/ && \
#    /usr/local/zope/Zope-2.13/bin/python2.7 setup.py install
# /tmp/Products.SQLAlchemyDA-0.6.2b1/Products/SQLAlchemyDA must be copied inside ZopeInstance later on.

# create zope user
RUN groupadd -r --gid 1000 zope && useradd --no-log-init -r -g zope --uid 1000 zope

WORKDIR /usr/local/zope
EXPOSE 1980 8080

# mount your own Zope instance into /usr/local/zope and run its runzope as CMD
RUN mkdir ZopeInstance
RUN chown zope ZopeInstance
USER zope

RUN /usr/local/zope/Zope-2.13/bin/mkzopeinstance --python=/usr/local/zope/Zope-2.13/bin/python2.7 -d /usr/local/zope/ZopeInstance -u admin:admin &&\
    cp -r /tmp/ZPsycopgDA-master/ZPsycopgDA /usr/local/zope/ZopeInstance/Products && \
    cp -r /tmp/Products.SQLAlchemyDA-0.6.0b/Products/SQLAlchemyDA /usr/local/zope/ZopeInstance/Products

WORKDIR /ZopeInstance/Products/SQLAlchemyDA/ 
RUN mkdir Models
WORKDIR /usr/local/zope
