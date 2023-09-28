package TFMTools
{
   import com.wreft.TFM.*;
   import com.wreft.TFM.data.*;
   import flash.utils.*;
   import tribulle.*;
   import flash.geom.*;
   import flash.display.*;
   import TFM.network.*;
   import wreft.aux.*;
   import flash.system.ApplicationDomain;
   
   public class PacketParser extends MovieClip
   {
      
      public function PacketParser()
      {
         super();
      }
      
      public static var packetHandler:Function = null;
      
      public static var joueursVisibilite:Dictionary = new Dictionary();
      
      public static var activateFiltreDesJoueurs:Boolean = false;
      
      public static var editeurSansLimite:Boolean = false;
      
      public static function setJoueursVisibilite() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in Utils.TFMInstance[TFMData.ListeJoueur])
         {
            if((PacketParser.joueursVisibilite[_loc1_[TFMData.PlayerName].toLowerCase()]) || !PacketParser.activateFiltreDesJoueurs)
            {
               _loc1_.visible = true;
            }
            else
            {
               if(Utils.TFMInstance[TFMData.ClipJoueur] != null)
               {
                  if(_loc1_[TFMData.PlayerName] == Utils.TFMInstance[TFMData.ClipJoueur][TFMData.PlayerName])
                  {
                     _loc1_.visible = true;
                     continue;
                  }
               }
               _loc1_.visible = false;
            }
         }
      }
      
      public static function onlymeHandler(param1:String = "") : void
      {
         if(param1 != "")
         {
            PacketParser.activateFiltreDesJoueurs = true;
            if(PacketParser.joueursVisibilite[param1.toLowerCase()])
            {
               delete PacketParser.joueursVisibilite[param1.toLowerCase()];
               true;
               true;
            }
            else
            {
               PacketParser.joueursVisibilite[param1.toLowerCase()] = true;
            }
         }
         else
         {
            PacketParser.activateFiltreDesJoueurs = false;
            PacketParser.joueursVisibilite = new Dictionary();
         }
         PacketParser.setJoueursVisibilite();
      }
      
      public static function interfaceVisibiliteHandler() : void
      {
         Utils.TFMInstance._I.alpha = Utils.TFMInstance._I.alpha == 1?0:1;
      }
      
	  
	  
      public static function activateEditeurSansLimite() : void
      {
         PacketParser.editeurSansLimite = !PacketParser.editeurSansLimite;
         TFMData.MapEditeurClass(PacketParser.editeurSansLimite);
         ProxyTribulle.x_messageChat("<R>Editeur sans limité => " + _SafeStr_12116.CoerceString(PacketParser.editeurSansLimite) + "</R>");
      }
      
      public static function InitializeDataClasses() : void
      {
         TFMData.SWFLoaderClass = Utils.GetClass(TFMData.SWFLoaderClassName);
         TFMData.CommandManagerClass1 = Utils.GetClass(TFMData.CommandManagerClassName1);
         TFMData.ClipJoueurClass = Utils.GetClass(TFMData.ClipJoueurClassName);
         TFMData.AnimResourcesClass = Utils.GetClass(TFMData.AnimResourcesClassName);
         TFMData.AnimGetSpritesClass = Utils.GetClass(TFMData.AnimGetSpritesClassName);
         TFMData.ObjectMovieClip1Class = Utils.GetClass(TFMData.ObjectMovieClip1ClassName);
         TFMData.EventDispatcherClass = Utils.GetClass(TFMData.EventDispatcherClassName);
         TFMData.TFMLanguesClass = Utils.GetClass(TFMData.TFMLanguesClassName);
         TFMData.ResourcesSpriteClass = Utils.GetClass(TFMData.ResourcesSpriteClassName);
         TFMData.GameResourcesClass = Utils.GetClass(TFMData.GameResourcesClassName);
         TFMData.ResourcesAuxiliaryClass = Utils.GetClass(TFMData.ResourcesAuxiliaryClassName);
         TFMData.MapEditeurClass = Utils.GetClass(TFMData.MapEditeurClassName);
         TFMData.TFMNetworkClass = Utils.GetClass(TFMData.TFMNetworkClassName);
         TFMData.b2BodyClass = Utils.GetClass(TFMData.b2BodyClassName);
         TFMData.b2MassDataClass = Utils.GetClass(TFMData.b2MassDataClassName);
         TFMData.b2Vec2Class = Utils.GetClass(TFMData.b2Vec2ClassName);
         TFMData.b2ShapeClass = Utils.GetClass(TFMData.b2ShapeClassName);
         TFMData.b2ShapeDefClass = Utils.GetClass(TFMData.b2ShapeDefClassName);
         TFMData.ShopCategoriesSlotsClass = Utils.GetClass(TFMData.ShopCategoriesSlotsClassName);
         TFMData.ShopUtilsClass = Utils.GetClass(TFMData.ShopUtilsClassName);
         TFMData.ShopCategoriesVarsClass = Utils.GetClass(TFMData.ShopCategoriesVarsClassName);
         TFMData.ClipLookClass = Utils.GetClass(TFMData.ClipLookClassName);
         TFMData.Initialized = true;
         Utils.PARTS_SLOT[0] = new Array("Tete_1");
         Utils.PARTS_SLOT[1] = new Array("OeilVide_1","Oeil2_1","Oeil3_1","Oeil4_1");
         Utils.PARTS_SLOT[2] = new Array("OreilleD_1");
         Utils.PARTS_SLOT[3] = new Array("Tete_1");
         Utils.PARTS_SLOT[4] = new Array("Tete_1");
         Utils.PARTS_SLOT[5] = new Array("Tete_1");
         Utils.PARTS_SLOT[6] = new Array("Boule_1");
         Utils.PARTS_SLOT[7] = new Array("Oeil_1");
         Utils.PARTS_SLOT[8] = new Array("Gant_1");
         Utils.PARTS_SLOT[9] = new Array("Arme_1");
         Utils.PARTS_SLOT[10] = new Array("Bouclier_1");
         Utils.PARTS_SLOT[11] = new Array("CuisseD_1");
         Utils.PARTS_SLOT[101] = new Array("OreilleG_1");
         var _loc1_:int = TFMData.ShopUtilsClass[TFMData.ShopSlotsVector].indexOf(TFMData.ShopCategoriesSlotsClass[TFMData.SLOT$Mains]);
         Utils.Vector_insertAt(TFMData.ShopUtilsClass[TFMData.ShopSlotsVector],_loc1_ + 1,new TFMData.ShopCategoriesSlotsClass("$Tatouage",11));
         TFMData.ShopCategoriesVarsClass[TFMData.NormalCategoriesVector].push(11);
         TFMData.ShopCategoriesVarsClass[TFMData.AllCategoriesVector].push(11);
         TFMData.ClipLookClass[TFMData.CategoriesVectorLength] = TFMData.ShopCategoriesVarsClass[TFMData.AllCategoriesVector].length;
         var _loc2_:Vector.<int> = new Vector.<int>(1,true);
         _loc2_[0] = 9;
         TFMData.ResourcesSpriteClass[TFMData.LOOK_SLOT]["Arme_1"] = _loc2_;
         var _loc3_:Vector.<int> = new Vector.<int>(1,true);
         _loc3_[0] = 10;
         TFMData.ResourcesSpriteClass[TFMData.LOOK_SLOT]["Bouclier_1"] = _loc3_;
         var _loc4_:Vector.<int> = new Vector.<int>(1,true);
         _loc4_[0] = 11;
         TFMData.ResourcesSpriteClass[TFMData.LOOK_SLOT]["CuisseD_1"] = _loc4_;
         Utils.CUSTOM_ANIMATIONS[500] = [5,"Bart"];
      }
      
      public static function ChangeCurrentCustomPreviewAux(param1:MovieClip, param2:Array) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:DisplayObject = null;
         var _loc6_:String = null;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         if(param1)
         {
            _loc3_ = param1.numChildren;
            _loc4_ = -1;
            while(true)
            {
               _loc4_++;
               if(_loc4_ >= _loc3_)
               {
                  break;
               }
               _loc5_ = param1.getChildAt(_loc4_);
               _loc6_ = _loc5_.name;
               if(_loc6_)
               {
                  if(_loc6_.indexOf("Couleur") == 0)
                  {
                     _loc7_ = _SafeStr_12116.CoerceInteger(_loc6_.charAt(7));
                     _loc8_ = param2[_loc7_];
                     _loc9_ = _loc8_ >> 16 & 255;
                     _loc10_ = _loc8_ >> 8 & 255;
                     _loc11_ = _loc8_ & 255;
                     _loc5_.transform.colorTransform = new ColorTransform(_loc9_ / 128,_loc10_ / 128,_loc11_ / 128);
                  }
                  else if(_loc6_.indexOf("slot_") == 0)
                  {
                     PacketParser.ChangeCurrentCustomPreview(_loc5_ as MovieClip,param2);
                  }
                  
               }
            }
         }
      }
      
      public static function ChangeCurrentCustomPreview(param1:MovieClip, param2:Array) : void
      {
         var _loc3_:* = 0;
         PacketParser.ChangeCurrentCustomPreviewAux(param1,param2);
         var _loc4_:Array = param1["_accessoires"];
         if(_loc4_)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               PacketParser.ChangeCurrentCustomPreviewAux(_loc4_[_loc3_],param2);
               _loc3_++;
            }
         }
      }
      
      public static function RecupShopCustomization(param1:MovieClip, param2:Array) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:String = null;
         var _loc5_:* = 0;
         if(!param1)
         {
            return;
         }
         var _loc6_:* = param1.numChildren;
         var _loc7_:* = -1;
         while(true)
         {
            _loc7_++;
            if(_loc7_ >= _loc6_)
            {
               break;
            }
            _loc3_ = param1.getChildAt(_loc7_);
            _loc4_ = _loc3_.name;
            if(_loc4_)
            {
               if(_loc4_.indexOf("Couleur") == 0)
               {
                  _loc5_ = _SafeStr_12116.CoerceInteger(_loc4_.charAt(7));
                  param2[_loc5_] = _SafeStr_12116.CoerceInteger("0x" + _loc4_.split("_")[1]);
               }
               else if(_loc4_.indexOf("slot_") == 0)
               {
                  PacketParser.RecupShopCustomization(_loc3_ as MovieClip,param2);
               }
               
            }
         }
      }
      
      public static function RecupCostumeCustomizationAux(param1:MovieClip, param2:Array, param3:Array = null, param4:Boolean = false) : void
      {
         var _loc5_:DisplayObject = null;
         var _loc6_:String = null;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:* = param3?param3.length:0;
         var _loc13_:* = param1.numChildren;
         var _loc14_:* = -1;
         while(true)
         {
            _loc14_++;
            if(_loc14_ >= _loc13_)
            {
               break;
            }
            _loc5_ = param1.getChildAt(_loc14_);
            _loc6_ = _loc5_.name;
            if(_loc6_)
            {
               if(_loc6_.indexOf("Couleur") == 0)
               {
                  _loc7_ = _SafeStr_12116.CoerceInteger(_loc6_.charAt(7));
                  if(_loc7_ < _loc12_)
                  {
                     if(param4)
                     {
                        _loc8_ = _SafeStr_12116.CoerceInteger("0x" + param3[_loc7_]);
                     }
                     else
                     {
                        _loc8_ = param3[_loc7_];
                     }
                  }
                  else
                  {
                     _loc8_ = _SafeStr_12116.CoerceInteger("0x" + _loc6_.split("_")[1]);
                  }
                  _loc9_ = _loc8_ >> 16 & 255;
                  _loc10_ = _loc8_ >> 8 & 255;
                  _loc11_ = _loc8_ & 255;
                  _loc5_.transform.colorTransform = new ColorTransform(_loc9_ / 128,_loc10_ / 128,_loc11_ / 128);
               }
               else if(_loc6_.indexOf("slot_") == 0)
               {
                  param2.push(_loc5_);
                  PacketParser.RecupCostumeCustomizationAux(_loc5_ as MovieClip,param2,param3,param4);
               }
               
            }
         }
      }
      
      public static function RecupCostumeCustomization(param1:MovieClip, param2:Array, param3:Array = null, param4:Boolean = false) : void
      {
         PacketParser.RecupCostumeCustomizationAux(param1,param2,param3,param4);
         param1["_accessoires"] = param2;
      }
      
      public static function RecupChamaneCustomization(param1:MovieClip, param2:Array, param3:Vector.<int>, param4:int) : void
      {
         var _loc5_:MovieClip = null;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = param1.numChildren;
         var _loc12_:* = -1;
         while(true)
         {
            _loc12_++;
            if(_loc12_ >= _loc11_)
            {
               break;
            }
            _loc5_ = param1.getChildAt(_loc12_) as MovieClip;
            if(_loc5_)
            {
               if(_loc5_.name.indexOf("slot_") == 0)
               {
                  param2.push(_loc5_);
               }
               else if(_loc5_.name.charAt(0) == "c" && param4 == 0)
               {
                  _loc6_ = _SafeStr_12116.CoerceInteger(_loc5_.name.charAt(1));
                  if(param3.length > _loc6_)
                  {
                     _loc7_ = param3[_loc6_];
                     _loc8_ = _loc7_ >> 16 & 255;
                     _loc9_ = _loc7_ >> 8 & 255;
                     _loc10_ = _loc7_ & 255;
                     _loc5_.transform.colorTransform = new ColorTransform(_loc8_ / 128,_loc9_ / 128,_loc10_ / 128);
                  }
               }
               
               if(1 >= param4)
               {
                  PacketParser.RecupChamaneCustomization(_loc5_,param2,param3,param4 + 1);
               }
            }
         }
      }
      
      public static function RecupAnimation(param1:int, param2:int, param3:int, param4:String, param5:String, param6:Vector.<int>, param7:Boolean = false) : MovieClip
      {
         var _loc8_:Sprite = null;
         var _loc9_:* = 0;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:MovieClip = null;
         var _loc13_:MovieClip = null;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:Sprite = null;
         var _loc17_:* = 0;
         var _loc18_:* = 0;
         var _loc19_:* = 0;
         var _loc20_:* = 0;
         var _loc21_:* = 0;
         var _loc22_:Vector.<int> = null;
         var _loc23_:* = 0;
         var _loc24_:* = 0;
         var _loc25_:* = 0;
         var _loc26_:String = null;
         var _loc27_:Array = null;
         var _loc28_:* = 0;
         var _loc29_:Array = null;
         var _loc30_:MovieClip = null;
         var _loc31_:Array = null;
         var _loc32_:MovieClip = null;
         var _loc33_:MovieClip = null;
         var _loc34_:String = null;
         var _loc35_:* = false;
         var _loc36_:* = false;
         var _loc37_:* = 0;
         var _loc38_:Array = null;
         var _loc39_:MovieClip = null;
         var _loc40_:DisplayObjectContainer = null;
         var _loc41_:Point = null;
         var _loc42_:Array = new Array();
         if(!TFMData.Initialized)
         {
            PacketParser.InitializeDataClasses();
         }
         if(2 == param1)
         {
            var param2:* = 40;
            var param3:* = 1;
         }
         var _loc45_:ApplicationDomain = TFMData.ResourcesSpriteClass[TFMData.AppDomainDictionary][param1];
         if(!_loc45_.hasDefinition(param4))
         {
            return new MovieClip();
         }
         var _loc46_:MovieClip = new (_loc45_.getDefinition(param4) as Class)();
         if(!_loc46_)
         {
            return new MovieClip();
         }
         var _loc47_:int = param5.indexOf(";");
         if(_loc47_ != -1)
         {
            var param5:String = param5.split(";")[1];
         }
         var _loc49_:Array = param5?param5.split(","):null;
         var _loc50_:* = _loc46_.numChildren;
         var _loc51_:* = -1;
         while(true)
         {
            _loc51_++;
            if(_loc51_ >= _loc50_)
            {
               break;
            }
            _loc8_ = _loc46_.getChildAt(_loc51_) as Sprite;
            if(_loc8_)
            {
               _loc9_ = param6?param6.length:0;
               _loc10_ = _loc8_.name;
               if(_loc10_.indexOf("instance") != 0)
               {
                  if(param3 == 3 && !(_loc10_ == "Boule_1") && !(_loc10_ == "Tete_1"))
                  {
                     _loc11_ = "_" + _loc10_ + "_" + param2 + "_2";
                  }
                  else
                  {
                     _loc11_ = "_" + _loc10_ + "_" + param2 + "_" + param3;
                  }
                  if(TFMData.ResourcesSpriteClass[TFMData.CurrentApplicationDomain].hasDefinition(_loc11_))
                  {
                     _loc12_ = new (TFMData.ResourcesSpriteClass[TFMData.CurrentApplicationDomain].getDefinition(_loc11_) as Class)();
                     if(_loc12_)
                     {
                        _loc8_.addChild(_loc12_);
                        if(param7 && _loc10_ == "CuisseD_1")
                        {
                           _loc13_ = TFMData.SWFLoaderClass("$AileChamane");
                           _loc13_.x = 10;
                           _loc13_.y = -8;
                           _loc13_.scaleX = 0.9;
                           _loc13_.scaleY = 0.9;
                           _loc13_.rotation = -10;
                           _loc8_.addChild(_loc13_);
                           if(1 < _loc9_)
                           {
                              _loc18_ = param6[1];
                              _loc19_ = _loc18_ >> 16 & 255;
                              _loc20_ = _loc18_ >> 8 & 255;
                              _loc21_ = _loc18_ & 255;
                              MovieClip(_loc13_["c1"]).transform.colorTransform = new ColorTransform(_loc19_ / 128,_loc20_ / 128,_loc21_ / 128);
                           }
                        }
                        PacketParser.RecupChamaneCustomization(_loc12_,_loc42_,param6,0);
                     }
                  }
               }
               if(param5)
               {
                  _loc22_ = TFMData.ResourcesSpriteClass[TFMData.LOOK_SLOT][_loc10_];
                  if(_loc22_)
                  {
                     _loc23_ = _loc22_.length;
                     _loc24_ = -1;
                     while(true)
                     {
                        _loc24_++;
                        if(_loc24_ >= _loc23_)
                        {
                           break;
                        }
                        _loc25_ = _loc22_[_loc24_];
                        _loc26_ = _loc49_[_loc25_];
                        _loc27_ = null;
                        if((_loc26_) && !(_loc26_.indexOf("_") == -1))
                        {
                           _loc29_ = _loc26_.split("_");
                           _loc28_ = _SafeStr_12116.CoerceInteger(_loc29_[0]);
                           _loc27_ = _loc29_[1].split("+");
                        }
                        else
                        {
                           _loc28_ = _SafeStr_12116.CoerceInteger(_loc26_);
                        }
                        if(_loc28_)
                        {
                           _loc30_ = TFMData.ResourcesSpriteClass(_loc25_,_loc28_,_loc27_,true);
                           if(_loc28_ > 99)
                           {
                              _loc30_.name = "Costume_" + (_loc25_ * 10000 + _loc28_ + 10000);
                           }
                           else
                           {
                              _loc30_.name = "Costume_" + (_loc25_ * 100 + _loc28_);
                           }
                           if(_loc30_)
                           {
                              if(_loc25_ == 5 || _loc25_ == 4)
                              {
                                 _loc8_.addChildAt(_loc30_,1);
                              }
                              else if(6 == _loc25_)
                              {
                                 if(_loc8_.numChildren)
                                 {
                                    _loc8_.removeChildAt(0);
                                 }
                                 _loc8_.addChild(_loc30_);
                              }
                              else
                              {
                                 _loc8_.addChild(_loc30_);
                              }
                              
                           }
                           if(_loc30_["_accessoires"])
                           {
                              _loc42_ = _loc42_.concat(_loc30_["_accessoires"]);
                           }
                        }
                     }
                  }
               }
            }
         }
         if(_loc42_.length)
         {
            _loc51_ = 0;
            while(_loc51_ < _loc42_.length)
            {
               _loc33_ = _loc42_[_loc51_];
               _loc34_ = _loc33_.name.substr(5);
               _loc35_ = _loc34_.substr(0,6) == "behind";
               _loc36_ = _loc34_.substr(0,5) == "first";
               if(_loc35_)
               {
                  _loc34_ = _loc34_.substr(7);
               }
               else if(_loc36_)
               {
                  _loc34_ = _loc34_.substr(6);
               }
               
               _loc37_ = _SafeStr_12116.CoerceInteger(_loc34_);
               _loc38_ = Utils.PARTS_SLOT[_loc37_];
               if(_loc38_)
               {
                  _loc28_ = 0;
                  while(_loc28_ < _loc38_.length)
                  {
                     _loc39_ = _loc46_[_loc38_[_loc28_]];
                     if(_loc39_)
                     {
                        _loc40_ = _loc33_.parent;
                        _loc41_ = _loc39_.globalToLocal(_loc40_.localToGlobal(new Point(_loc33_.x,_loc33_.y)));
                        _loc33_.x = _loc41_.x;
                        _loc33_.y = _loc41_.y;
                        if(_loc35_)
                        {
                           _loc39_.addChildAt(_loc33_,0);
                        }
                        else if(_loc36_)
                        {
                           _loc39_.addChildAt(_loc33_,1);
                        }
                        else
                        {
                           _loc39_.addChild(_loc33_);
                        }
                        
                     }
                     _loc28_++;
                  }
               }
               _loc51_++;
            }
         }
         return _loc46_;
      }
      
      public static function RecupAnimVecto(param1:String, param2:Boolean, param3:Boolean = false, param4:* = null) : MovieClip
      {
         var _loc5_:* = param4 != null?param4:Utils.TFMInstance[TFMData.ClipJoueur][TFMData.AnimGetSpritesInstance];
         var _loc6_:* = _loc5_[TFMData.IndianaMouseSet]?3:param1 == "AnimDanse2"?4:1;
         var _loc7_:Array = Utils.CUSTOM_ANIMATIONS[_loc5_[TFMData.PlayerFur]];
         if(_loc7_ != null)
         {
            if(TFMData.ResourcesSpriteClass[TFMData.AppDomainDictionary][_loc7_[0]].hasDefinition(param1 + _loc7_[1]))
            {
               _loc6_ = _loc7_[0];
               var param1:String = param1 + _loc7_[1];
            }
         }
         var _loc9_:MovieClip = PacketParser.RecupAnimation(_loc6_,_loc5_[TFMData.PlayerFur],_loc5_[TFMData.PlayerSkinMode],param1,_loc5_[TFMData.PlayerLook],_loc5_[TFMData.PlayerCouleurs],param3);
         _loc9_.name = param1;
         _loc9_.y = 1;
         if(!_loc9_)
         {
            _loc9_ = new MovieClip();
         }
         if(param2)
         {
            if(_loc9_.ClipGrosse)
            {
               _loc9_.ClipGrosse.addChild(TFMData.AnimResourcesClass());
            }
         }
         if(_loc5_[TFMData.PlayerSkinMode] != 1)
         {
            _loc9_.scaleX = TFMData.ResourcesAuxiliaryClass[TFMData.ResourcesAuxiliaryInstance][TFMData.ResourcesAuxiliaryScaleMultiplier];
            _loc9_.scaleY = TFMData.ResourcesAuxiliaryClass[TFMData.ResourcesAuxiliaryInstance][TFMData.ResourcesAuxiliaryScaleMultiplier];
         }
         else
         {
            _loc9_.scaleX = _loc5_[TFMData.AnimResourcesScaleMultiplier];
            _loc9_.scaleY = _loc5_[TFMData.AnimResourcesScaleMultiplier];
         }
         _loc9_.gotoAndStop(1);
         return _loc9_;
      }
      
      public static function Handle(param1:int, param2:int, param3:ByteArray) : Boolean
      {
         var param3:ByteArray = param3;
         var joueur:Object = null;
         var swfPath:String = null;
         var setIndiana:Boolean = false;
         var playerCode:uint = 0;
         var playerLook:String = null;
         var playerMouseColor:int = 0;
         var playerShamanColor:int = 0;
         var playerAnimationMode:int = 0;
         var usePlayerLook:Boolean = false;
         var animsLength:int = 0;
         var splitedLook:Array = null;
         var i:int = 0;
         var animName:String = null;
         var animNameChange:String = null;
         var animIndex:String = null;
         var animEventDispatcher:Object = null;
         var animEventDispatcherCheese:Object = null;
         var community:String = null;
         var languesLength:uint = 0;
         var texteName:String = null;
         var texteContent:String = null;
         var suffixeFromage:String = null;
         var suffixeTrouSouris:String = null;
         var properties:int = 0;
         var property:String = null;
         var propertyValue:Number = NaN;
         var sourisMass:* = undefined;
         var C:int = param1;
         var CC:int = param2;
         var data:ByteArray = param3;
         if(C == 5)
         {
            if(CC == 2)
            {
               if(PacketParser.activateFiltreDesJoueurs)
               {
                  setTimeout(PacketParser.setJoueursVisibilite,1000);
               }
               for each(joueur in Utils.TFMInstance[TFMData.ListeJoueur])
               {
                  joueur(false);
               }
               TFMData.MapEditeurClass(true);
            }
         }
         else if(C == 26)
         {
            if(CC == 2)
            {
               TFMData.CommandManagerClass1[TFMData.CommandManagerInstance]("antlag1",PacketParser.onlymeHandler);
               TFMData.CommandManagerClass1[TFMData.CommandManagerInstance]("antlag2",PacketParser.interfaceVisibiliteHandler);
            }
            else if(CC == 3)
            {
               if(!TFMData.Initialized)
               {
                  PacketParser.InitializeDataClasses();
               }
               TFMData.GameResourcesClass["SUFFIXE_FROMAGE"] = "";
               TFMData.GameResourcesClass["SUFFIXE_TROUSOURIS"] = "";
            }
            
         }
         else if(C == 144)
         {
            if(CC == 1)
            {
               if(PacketParser.activateFiltreDesJoueurs)
               {
                  setTimeout(PacketParser.setJoueursVisibilite,1000);
               }
               setTimeout(function():void
               {
                  var _loc1_:Object = null;
                  for each(_loc1_ in Utils.TFMInstance[TFMData.ListeJoueur])
                  {
                     if(_loc1_.parent != null)
                     {
                        _loc1_[TFMData.JoueurPhysique][TFMData.m_shapeList][TFMData.m_friction] = 0.25;
                     }
                  }
               },1500);
            }
            else if(CC == 2)
            {
               if(PacketParser.activateFiltreDesJoueurs)
               {
                  setTimeout(PacketParser.setJoueursVisibilite,1000);
               }
               setTimeout(function():void
               {
                  var _loc1_:Object = null;
                  for each(_loc1_ in Utils.TFMInstance[TFMData.ListeJoueur])
                  {
                     if(_loc1_.parent != null)
                     {
                        _loc1_[TFMData.JoueurPhysique][TFMData.m_shapeList][TFMData.m_friction] = 0.25;
                     }
                  }
               },1500);
            }
            
         }
         else if(C == 192)
         {
            if(CC == 1)
            {
               swfPath = data.readUTF();
               TFMData.SWFLoaderClass(swfPath);
               return true;
            }
            if(CC == 2)
            {
               setIndiana = data.readBoolean();
               TFMData.AnimResourcesClass();
               for each(joueur in Utils.TFMInstance[TFMData.ListeJoueur])
               {
                  joueur(setIndiana);
               }
               return true;
            }
            if(CC == 3)
            {
               playerCode = data.readUnsignedInt();
               playerLook = data.readUTF();
               playerMouseColor = data.readUnsignedInt();
               playerShamanColor = data.readUnsignedInt();
               playerAnimationMode = data.readByte();
               usePlayerLook = data.readBoolean();
               animsLength = data.readByte();
               splitedLook = null;
               joueur = Utils.TFMInstance[TFMData.ListeJoueur][playerCode];
               if(joueur != null)
               {
                  splitedLook = playerLook.split(";");
                  joueur[TFMData.AnimGetSpritesInstance][TFMData.PlayerLook] = usePlayerLook?splitedLook[1]:"0";
                  joueur[TFMData.AnimGetSpritesInstance][TFMData.PlayerFur] = usePlayerLook?parseInt(splitedLook[0]):-1;
                  joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimStatiqueVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimStatiqueVar];
                  joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimStatiqueCheeseVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimStatiqueCheeseVar];
                  joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimCourseVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimCourseVar];
                  joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimCourseCheeseVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimCourseCheeseVar];
                  try
                  {
                     i = 0;
                     while(i < animsLength)
                     {
                        animName = data.readUTF();
                        animNameChange = data.readUTF();
                        animIndex = data.readByte();
                        animEventDispatcher = animIndex != -1?Utils.GetAnimResource(animIndex,animNameChange,usePlayerLook?parseInt(splitedLook[0]):-1,usePlayerLook?splitedLook[1]:"0",playerAnimationMode,false,playerMouseColor,playerShamanColor):new TFMData.EventDispatcherClass(new TFMData.ObjectMovieClip1Class(TFMData.SWFLoaderClass(animNameChange),0),true);
                        animEventDispatcherCheese = animIndex != -1?Utils.GetAnimResource(animIndex,animNameChange,usePlayerLook?parseInt(splitedLook[0]):-1,usePlayerLook?splitedLook[1]:"0",playerAnimationMode,true,playerMouseColor,playerShamanColor):new TFMData.EventDispatcherClass(new TFMData.ObjectMovieClip1Class(TFMData.SWFLoaderClass(animNameChange),0),true);
                        if(animIndex == -1)
                        {
                           animEventDispatcher[TFMData.TFMWidth] = 40;
                           animEventDispatcher[TFMData.TFMHeight] = 65;
                           animEventDispatcherCheese[TFMData.TFMWidth] = 40;
                           animEventDispatcherCheese[TFMData.TFMHeight] = 65;
                        }
                        if(animName == "AnimStatique")
                        {
                           joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimStatiqueVar] = animEventDispatcher;
                           joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimStatiqueCheeseVar] = animEventDispatcherCheese;
                        }
                        else if(animName == "AnimCourse")
                        {
                           joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimCourseVar] = animEventDispatcher;
                           joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimCourseCheeseVar] = animEventDispatcherCheese;
                        }
                        else if(animName == "AnimDuck")
                        {
                           joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimDuckVar] = animEventDispatcher;
                           joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimDuckCheeseVar] = animEventDispatcherCheese;
                        }
                        
                        
                        i++;
                     }
                  }
                  catch(E:Error)
                  {
                     ProxyTribulle.x_messageChat(E.message);
                  }
               }
               return true;
            }
            if(CC == 4)
            {
               playerCode = data.readUnsignedInt();
               joueur = Utils.TFMInstance[TFMData.ListeJoueur][playerCode];
               if(joueur != null)
               {
                  joueur(false);
               }
               return true;
            }
            if(CC == 5)
            {
               playerCode = data.readUnsignedInt();
               playerLook = data.readUTF();
               joueur = Utils.TFMInstance[TFMData.ListeJoueur][playerCode];
               if(joueur != null)
               {
                  joueur(playerLook);
               }
               return true;
            }
            if(CC == 6)
            {
               community = data.readUTF();
               languesLength = data.readUnsignedShort();
               try
               {
                  if(TFMData.TFMLanguesClass[TFMData.TFMLanguesCommunitiesDictionary][community] != null)
                  {
                     i = 0;
                     while(i < languesLength)
                     {
                        texteName = data.readUTF();
                        texteContent = data.readUTF();
                        TFMData.TFMLanguesClass[TFMData.TFMLanguesCacheDictionary][community + "_1_" + "$" + texteName] = Utils.GetFormattedLangue(texteContent,false);
                        TFMData.TFMLanguesClass[TFMData.TFMLanguesCacheDictionary][community + "_2_" + "$" + texteName] = Utils.GetFormattedLangue(texteContent,true);
                        TFMData.TFMLanguesClass[TFMData.TFMLanguesCommunitiesDictionary][community][TFMData.TFMLanguesDictionary][texteName] = texteContent;
                        i++;
                     }
                  }
               }
               catch(E:Error)
               {
                  ProxyTribulle.x_messageChat(E.message);
               }
               return true;
            }
            if(CC == 7)
            {
               playerCode = data.readUnsignedInt();
               joueur = Utils.TFMInstance[TFMData.ListeJoueur][playerCode];
               if(joueur != null)
               {
                  try
                  {
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimStatiqueVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimStatiqueVar];
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimStatiqueCheeseVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimStatiqueCheeseVar];
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimCourseVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimCourseVar];
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimCourseCheeseVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimCourseCheeseVar];
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimDuckVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimDuckVar];
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.LastAnimDuckCheeseVar] = joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimDuckCheeseVar];
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimStatiqueVar] = Utils.GetAnimResource(3,"AnimStatique",-1,"0",false);
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimStatiqueCheeseVar] = Utils.GetAnimResource(3,"AnimStatique",-1,"0",true);
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimCourseVar] = Utils.GetAnimResource(3,"AnimCourse",-1,"0",false);
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimCourseCheeseVar] = Utils.GetAnimResource(3,"AnimCourse",-1,"0",true);
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimDuckVar] = Utils.GetAnimResource(3,"AnimDuck",-1,"0",false);
                     joueur[TFMData.AnimGetSpritesInstance][TFMData.AnimDuckCheeseVar] = Utils.GetAnimResource(3,"AnimDuck",-1,"0",true);
                  }
                  catch(E:Error)
                  {
                     ProxyTribulle.x_messageChat(E.message);
                  }
               }
               return true;
            }
            if(CC == 8)
            {
               suffixeFromage = data.readUTF();
               TFMData.GameResourcesClass["SUFFIXE_FROMAGE"] = suffixeFromage;
               return true;
            }
            if(CC == 9)
            {
               suffixeTrouSouris = data.readUTF();
               TFMData.GameResourcesClass["SUFFIXE_TROUSOURIS"] = suffixeTrouSouris;
               return true;
            }
            if(CC == 10)
            {
               playerCode = data.readUnsignedInt();
               joueur = Utils.TFMInstance[TFMData.ListeJoueur][playerCode];
               if(joueur != null)
               {
                  properties = data.readByte();
                  i = 0;
                  while(i < properties)
                  {
                     property = data.readUTF();
                     propertyValue = data.readUnsignedInt() / 10000;
                     if(property == "mass")
                     {
                        sourisMass = new TFMData.b2MassDataClass();
                        sourisMass[TFMData.mass] = propertyValue;
                        joueur[TFMData.JoueurPhysique](sourisMass);
                     }
                     else if(property == "friction")
                     {
                        joueur[TFMData.JoueurPhysique][TFMData.m_shapeList][TFMData.m_friction] = propertyValue;
                     }
                     else if(property == "restitution")
                     {
                        joueur[TFMData.JoueurPhysique][TFMData.m_shapeList][TFMData.m_restitution] = propertyValue;
                     }
                     else if(property == "density")
                     {
                        joueur[TFMData.JoueurPhysique][TFMData.m_shapeList][TFMData.m_density] = propertyValue;
                     }
                     
                     
                     
                     i++;
                  }
               }
               return true;
            }
         }
         
         
         
         return (MessageReader.messageReception(C,CC,data)) || AUXPKT_HandlePacket(C,CC,data) || (PacketParser.packetHandler) && PacketParser.packetHandler(C,CC,data);
      }
   }
}
