//>>built
define("epi-cms/widget/_HierarchicalModelMixin",["dojo/_base/declare","dojo/_base/lang","epi/shell/_HierarchicalModelMixin"],function(_1,_2,_3){return _1([_3],{isTypeOfRoot:function(_4){return !!(_4&&(this.isRoot(_4)||_4.isSubRoot));},isRoot:function(_5){return !!(_5&&this.root&&_5===this.root);}});});