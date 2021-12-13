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
            allure includeProperties: false, jdk: '', results: [[path: 'out/syntax-check/allure'], [path: 'out/smoke/allure'], [path: '/out/allure']]
            junit allowEmptyResults: true, testResults: 'out/syntax-check/junit/junit.xml'
            junit allowEmptyResults: true, testResults: 'out/*.xml'
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
        stage("Syntax control") {
            steps {
                bat "chcp 65001\n vrunner syntax-check"
 
            }
        }
       stage("Smoke tests") {
            steps {
                script{
                    try {
                        bat "chcp 65001\n runner xunit"
                    } catch(Exception Exc) {
                         currentBuild.result = 'UNSTABLE'
                    }
                }
 
            }
        }
    stage("vanessa") {
            steps {
                script{
                    try {
                        bat "chcp 65001\n runner vanessa"
                    } catch(Exception Exc) {
                         currentBuild.result = 'UNSTABLE'
                    }
                }
 
            }
        }


    }
}
