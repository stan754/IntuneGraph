# Installation
## Prerequisites
The only dependency for this module is the `Microsoft.Graph.Authentication` Powershell module.
Which can be installed using:

```Powershell
Install-Module Microsoft.Graph.Authentication -Scope CurrentUser -Repository PSGallery -Force
```

## Installation
To install the Module you can either download a local copy by cloning this Git repository or install it from PSGallery.

```Powershell
Install-Module -Name IntuneGraph -Scope CurrentUser -Repository PSGallery -Force
```

## Import
After installing the prerequisites the module should be ready to use and can be imported using:

```Powershell
Import-Module IntuneGraph
```