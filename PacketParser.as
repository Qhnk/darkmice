package TFMTools
{
   import com.wreft.TFM.*;
   import com.wreft.TFM.data.*;
   import flash.utils.*;
   import tribulle.*;
   import flash.geom.*;
   import flash.display.*;
   import flash.system.ApplicationDomain;
   import TFM.network.*;
   import wreft.aux.*;
   
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
         TFMData.MapEditeurClass[TFMData.ActivateEditeurSansLimite](PacketParser.editeurSansLimite);
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
            while(++_loc4_ < _loc3_)
            {
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
         var _loc6_:int = param1.numChildren;
         var _loc7_:int = -1;
         while(++_loc7_ < _loc6_)
         {
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
         var _loc13_:int = param1.numChildren;
         var _loc14_:int = -1;
         while(++_loc14_ < _loc13_)
         {
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
         var _loc11_:int = param1.numChildren;
         var _loc12_:int = -1;
         while(++_loc12_ < _loc11_)
         {
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
         /*
          * Decompilation error
          * Code may be obfuscated
          * Deobfuscation is activated but decompilation still failed. If the file is NOT obfuscated, disable "Automatic deobfuscation" for better results.
          * Error type: TranslateException
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to error");
      }
      
      public static function RecupAnimVecto(param1:String, param2:Boolean, param3:Boolean = false, param4:* = null) : MovieClip
      {
         var _loc5_:* = param4 != null?param4:Utils.TFMInstance[TFMData.ClipJoueur][TFMData.AnimGetSpritesInstance];
         var _loc6_:int = _loc5_[TFMData.IndianaMouseSet]?3:param1 == "AnimDanse2"?4:1;
         var _loc7_:Array = Utils.CUSTOM_ANIMATIONS[_loc5_[TFMData.PlayerFur]];
         if(_loc7_ != null)
         {
            if(TFMData.ResourcesSpriteClass[TFMData.AppDomainDictionary][_loc7_[0]].hasDefinition(param1 + _loc7_[1]))
            {
               _loc6_ = _loc7_[0];
               var param1:String = param1 + _loc7_[1];
            }
         }
         var _loc8_:MovieClip = PacketParser.RecupAnimation(_loc6_,_loc5_[TFMData.PlayerFur],_loc5_[TFMData.PlayerSkinMode],param1,_loc5_[TFMData.PlayerLook],_loc5_[TFMData.PlayerCouleurs],param3);
         _loc8_.name = param1;
         _loc8_.y = 1;
         if(!_loc8_)
         {
            _loc8_ = new MovieClip();
         }
         if(param2)
         {
            if(_loc8_.ClipGrosse)
            {
               _loc8_.ClipGrosse.addChild(TFMData.AnimResourcesClass[TFMData.RecupClipFromage]());
            }
         }
         if(_loc5_[TFMData.PlayerSkinMode] != 1)
         {
            _loc8_.scaleX = TFMData.ResourcesAuxiliaryClass[TFMData.ResourcesAuxiliaryInstance][TFMData.ResourcesAuxiliaryScaleMultiplier];
            _loc8_.scaleY = TFMData.ResourcesAuxiliaryClass[TFMData.ResourcesAuxiliaryInstance][TFMData.ResourcesAuxiliaryScaleMultiplier];
         }
         else
         {
            _loc8_.scaleX = _loc5_[TFMData.AnimResourcesScaleMultiplier];
            _loc8_.scaleY = _loc5_[TFMData.AnimResourcesScaleMultiplier];
         }
         _loc8_.gotoAndStop(1);
         return _loc8_;
      }
      
      public static function Handle(param1:int, param2:int, param3:ByteArray) : Boolean
      {
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
                  joueur[TFMData.AnimIndianaMouseInit](false);
               }
               TFMData.MapEditeurClass[TFMData.ActivateEditeurSansLimite](true);
            }
         }
         else if(C == 26)
         {
            if(CC == 2)
            {
               TFMData.CommandManagerClass1[TFMData.CommandManagerInstance][TFMData.CommandManagerAddCommand]("onlyme",PacketParser.onlymeHandler);
               TFMData.CommandManagerClass1[TFMData.CommandManagerInstance][TFMData.CommandManagerAddCommand]("x_i_vis",PacketParser.interfaceVisibiliteHandler);
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
               TFMData.SWFLoaderClass[TFMData.SWFLoaderMethod](swfPath);
               return true;
            }
            if(CC == 2)
            {
               setIndiana = data.readBoolean();
               TFMData.AnimResourcesClass[TFMData.AnimResourcesInit]();
               for each(joueur in Utils.TFMInstance[TFMData.ListeJoueur])
               {
                  joueur[TFMData.AnimIndianaMouseInit](setIndiana);
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
                        animEventDispatcher = animIndex != -1?Utils.GetAnimResource(animIndex,animNameChange,usePlayerLook?parseInt(splitedLook[0]):-1,usePlayerLook?splitedLook[1]:"0",playerAnimationMode,false,playerMouseColor,playerShamanColor):new TFMData.EventDispatcherClass(new TFMData.ObjectMovieClip1Class(TFMData.SWFLoaderClass[TFMData.GetResourceClass](animNameChange),0),true);
                        animEventDispatcherCheese = animIndex != -1?Utils.GetAnimResource(animIndex,animNameChange,usePlayerLook?parseInt(splitedLook[0]):-1,usePlayerLook?splitedLook[1]:"0",playerAnimationMode,true,playerMouseColor,playerShamanColor):new TFMData.EventDispatcherClass(new TFMData.ObjectMovieClip1Class(TFMData.SWFLoaderClass[TFMData.GetResourceClass](animNameChange),0),true);
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
                  joueur[TFMData.AnimIndianaMouseInit](false);
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
                  joueur["_SafeStr_4596"](playerLook);
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
                        joueur[TFMData.JoueurPhysique][TFMData.SetMass](sourisMass);
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
         
         
         
         return (MessageReader.messageReception(C,CC,data)) || (AUXPKT_HandlePacket(C,CC,data)) || (PacketParser.packetHandler) && (PacketParser.packetHandler(C,CC,data));
      }
   }
}
