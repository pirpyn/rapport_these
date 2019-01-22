# Overleaf et Git/Github

Cette thèse utilise Overleaf et Github pour plusieurs raisons:
 - Overleaf permet de collaborer à plusieurs (2 max) et via un navigateur : lent mais parfait en déplacement.
 - Github permet d'avoir autant de collaborateur que possible, mais ne fournit pas d'interface : contraignant mais plus efficace.
 - Les deux fournissent un bon moyen à la thèse d'être pérenne

Afin de garantir la sécurité des publications, les deux projets sont privés, et seul les adresses autorisées y ont accès.

# Git/Github

[Url du projet](https://github.com/pirpyn/rapport_these), il est privé.

Versionnée par git, la thèse possède 2 branches principales
- `master` est la branche d'interaction GitHub <-> Overleaf
- `final` contiendra un avancement de la thèse.

# Méthodologie 

En local, travailler sur une branche locale `perso`, commiter puis fusionner avec `master`
    git commit
    git checkout master
    git merge --no-ff perso
    git push origin master

Dans un navigateur,sur Overleaf, fusionner ces modifications via le menu du bandeau latéral, et travailler sur Overleaf si besoin.
Dans ce cas, penser à propager les résultats sur le GitHub via le même menu

