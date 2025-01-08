from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <!DOCTYPE html>
    <html>
        <head>
            <title>Welcome to My CI/CD Project</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f4f4f9;
                    color: #333;
                    margin: 0;
                    padding: 0;
                }
                .container {
                    text-align: center;
                    padding: 50px;
                }
                h1 {
                    color: #4CAF50;
                    font-size: 3em;
                }
                p {
                    font-size: 1.2em;
                    margin: 20px 0;
                }
                .footer {
                    margin-top: 50px;
                    font-size: 0.9em;
                    color: #666;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>Welcome to My CI/CD Project!</h1>
                <p>This is a simple Python Flask web application showcasing continuous integration and deployment.</p>
                <p>Deployed using AWS CodePipeline and CodeDeploy.</p>
                <div class="footer">Created by Abdulrajak </div>
            </div>
        </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
