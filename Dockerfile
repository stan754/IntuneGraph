FROM squidfunk/mkdocs-material
RUN pip install mkdocs-macros-plugin
RUN pip install mkdocs-macros-plugin 
RUN pip install mkdocs-git-revision-date-localized-plugin 
RUN pip install mkdocs-git-authors-plugin 
RUN pip install mkdocs-material[imaging]
RUN pip install mkdocs-awesome-pages-plugin
RUN pip install mkdocs-print-site-plugin