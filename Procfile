# web: gunicorn data-mode1:app --log-file -

# web: jupyter extension enable voila.server_extension --sys-prefix && jupyter server --ServerApp.default_url=/voila --ip=0.0.0.0 --ServerApp.open_browser=False --port=$PORT --ServerApp.token=''

web: voila --port=$PORT --no-browser covid19-model.ipynb --template=material --enable_nbextensions=True # --template=gridstack --theme=dark