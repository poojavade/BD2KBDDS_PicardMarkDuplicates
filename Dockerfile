FROM bd2kbdds/base_image

COPY picard/ /usr/local/picard/

ENV PICARD "/usr/local/picard/"

ENV PATH "$PICARD:$PATH"