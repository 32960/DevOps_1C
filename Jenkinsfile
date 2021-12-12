pipeline
{
    agent {
        label 'OneS'
    }
    
    environment {
        envString = 'true'
    }
 
    post {
        always {
            allure includeProperties: false, jdk: '', results: [[path: 'out/syntax-check/allure']]
            junit allowEmptyResults: true, testResults: 'out/syntax-check/junit/junit.xml'
        }
    
        failure {
            bat "echo failure"
        }
        
        success {
            bat "echo success"      
        }
    }
    stages {
        stage("Sozdanie testovoy bazy") {
            steps {
                bat "chcp 65001\n vrunner init-dev --dt C:\\tools\\dt_vygruzki\\course.dt --db-user Administrator --src src/cf" 
            }
        }
        stage("Syntax kontrol") {
            steps {
                bat "chcp 65001\n vrunner syntax-check"
 
            }
        }

    }
}
