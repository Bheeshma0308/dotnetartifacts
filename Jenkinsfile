pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Restore Dependencies') {
            steps {
                script {
                    sh 'dotnet restore'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Use the .NET Core SDK to build the project
                    sh 'dotnet build --configuration Release'
                }
            }
        }
        stage('Publish') {
            steps {
                script {
                    // Use the .NET Core SDK to publish the project
                    sh 'dotnet publish --configuration Release --output ./publish'
                }
            }
        }
    }
}
