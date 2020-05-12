# web: gunicorn data-mode1:app --log-file -

# web: jupyter extension enable voila.server_extension --sys-prefix && jupyter server --ServerApp.default_url=/voila --ip=0.0.0.0 --ServerApp.open_browser=False --port=$PORT --ServerApp.token=''

# web: voila --port=$PORT --no-browser --template=material --enable_nbextensions=True DataVisualization.ipynb --template=gridstack --theme=dark 

web: voila --theme=dark --port=$PORT --no-browser --template=material --enable_nbextensions=True DataVisualization.html --template=gridstack --theme=dark 