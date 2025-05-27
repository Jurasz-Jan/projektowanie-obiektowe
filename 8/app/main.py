from flask import Flask, request, render_template, jsonify
from utils import format_name

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/hello')
def hello():
    name = request.args.get('name', '')
    return render_template('hello.html', name=format_name(name))

@app.route('/api/hello')
def api_hello():
    name = request.args.get('name', '')
    if not name:
        return jsonify({'error': 'Missing name'}), 400
    return jsonify({'message': f'Czesc, {format_name(name)}!'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')