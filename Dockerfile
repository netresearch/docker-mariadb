FROM mariadb

RUN apt-get update \
 && apt-get upgrade -y --force-yes -o Dpkg::Options::="--force-confnew" --no-install-recommends \
 && apt-get autoremove \
 && apt-get clean -y \
 && rm -rf /tmp/* \
 && rm -rf /var/tmp/* \
 && for logs in `find /var/log -type f`; do > $logs; done \
 && rm -rf /usr/share/locale/* \
 && rm -rf /usr/share/man/* \
 && rm -rf /usr/share/doc/* \
 && rm -rf /var/lib/apt/lists/* \
 && rm -f /var/cache/apt/*.bin

ADD setup/ /

RUN chmod +x /usr/local/bin/* \
    && chmod 777 /usr/local/bin/*

RUN cd /tmp \
    && touch test.txt

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
