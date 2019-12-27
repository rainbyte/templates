import * as vscode from 'vscode'; // Extensibility API

// Firing event indicated on package.json activationEvents
function activate(context: vscode.ExtensionContext) {
    // Command should be declared on package.json contributes
    let disposable = vscode.commands.registerCommand('extension.foo', () => {
        vscode.window.showInformationMessage('foo');
    });

    context.subscriptions.push(disposable);
}

function deactivate() {

}

export { activate, deactivate }
