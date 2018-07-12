<?xml version="1.0" encoding="utf-8"?>
<!-- generated with COPASI 4.22 (Build 170) (http://www.copasi.org) at 2018-07-10 08:15:45 UTC -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI copasiSourcesModified="0" versionDevel="170" versionMajor="4" versionMinor="22" xmlns="http://www.copasi.org/static/schema">
 <ListOfFunctions>
  <Function key="Function_39" name="Function for eq_biomass" reversible="true" type="UserDefined">
   <Expression>
    mu*biomass/comp1
   </Expression>
   <ListOfParameterDescriptions>
    <ParameterDescription key="FunctionParameter_254" name="biomass" order="0" role="product"/>
    <ParameterDescription key="FunctionParameter_258" name="comp1" order="1" role="volume"/>
    <ParameterDescription key="FunctionParameter_264" name="mu" order="2" role="constant"/>
   </ListOfParameterDescriptions>
  </Function>
  <Function key="Function_40" name="Function for eq_serine" reversible="unspecified" type="UserDefined">
   <Expression>
    rp_s/comp1
   </Expression>
   <ListOfParameterDescriptions>
    <ParameterDescription key="FunctionParameter_262" name="comp1" order="0" role="volume"/>
    <ParameterDescription key="FunctionParameter_265" name="rp_s" order="1" role="constant"/>
   </ListOfParameterDescriptions>
  </Function>
  <Function key="Function_41" name="Function for eq_glucose" reversible="unspecified" type="UserDefined">
   <Expression>
    r_s/comp1
   </Expression>
   <ListOfParameterDescriptions>
    <ParameterDescription key="FunctionParameter_267" name="comp1" order="0" role="volume"/>
    <ParameterDescription key="FunctionParameter_266" name="r_s" order="1" role="constant"/>
   </ListOfParameterDescriptions>
  </Function>
 </ListOfFunctions>
 <Model areaUnit="m²" avogadroConstant="6.0221417899999999e+23" key="Model_1" lengthUnit="m" name="IDModel" quantityUnit="mol" simulationType="time" timeUnit="s" type="deterministic" volumeUnit="l">
  <MiriamAnnotation>
   <RDF>
    <Description about="#Model_1">
     <created>
      <Description>
       <W3CDTF>
        2018-06-07T14:51:21Z
       </W3CDTF>
      </Description>
     </created>
    </Description>
   </RDF>
  </MiriamAnnotation>
  <ListOfCompartments>
   <Compartment dimensionality="3" key="Compartment_0" name="comp1" simulationType="fixed">
   </Compartment>
  </ListOfCompartments>
  <ListOfMetabolites>
   <Metabolite compartment="Compartment_0" key="Metabolite_0" name="glucose" simulationType="reactions">
   </Metabolite>
   <Metabolite compartment="Compartment_0" key="Metabolite_1" name="serine" simulationType="reactions">
   </Metabolite>
   <Metabolite compartment="Compartment_0" key="Metabolite_2" name="biomass" simulationType="reactions">
   </Metabolite>
  </ListOfMetabolites>
  <ListOfModelValues>
   <ModelValue key="ModelValue_0" name="alpha" simulationType="fixed">
   </ModelValue>
   <ModelValue key="ModelValue_1" name="beta" simulationType="fixed">
   </ModelValue>
   <ModelValue key="ModelValue_2" name="mu_max" simulationType="fixed">
   </ModelValue>
   <ModelValue key="ModelValue_3" name="kc" simulationType="fixed">
   </ModelValue>
   <ModelValue key="ModelValue_4" name="a" simulationType="fixed">
   </ModelValue>
   <ModelValue key="ModelValue_5" name="b" simulationType="fixed">
   </ModelValue>
   <ModelValue key="ModelValue_6" name="ms" simulationType="fixed">
   </ModelValue>
   <ModelValue key="ModelValue_7" name="v0" simulationType="fixed">
   </ModelValue>
   <ModelValue key="ModelValue_8" name="v" simulationType="assignment">
    <Expression>
     0.00010302999999999999-1.2099999999999998e-06*&lt;CN=Root,Model=IDModel,Reference=Time&gt;
    </Expression>
   </ModelValue>
   <ModelValue key="ModelValue_9" name="c_glucose" simulationType="assignment">
    <Expression>
     &lt;CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose],Reference=Concentration&gt;/&lt;CN=Root,Model=IDModel,Vector=Values[v],Reference=Value&gt;
    </Expression>
   </ModelValue>
   <ModelValue key="ModelValue_10" name="c_biomass" simulationType="assignment">
    <Expression>
     &lt;CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass],Reference=Concentration&gt;/&lt;CN=Root,Model=IDModel,Vector=Values[v],Reference=Value&gt;
    </Expression>
   </ModelValue>
   <ModelValue key="ModelValue_11" name="mu" simulationType="assignment">
    <Expression>
     &lt;CN=Root,Model=IDModel,Vector=Values[mu_max],Reference=Value&gt;*(&lt;CN=Root,Model=IDModel,Vector=Values[c_glucose],Reference=Value&gt;/(&lt;CN=Root,Model=IDModel,Vector=Values[kc],Reference=Value&gt;*&lt;CN=Root,Model=IDModel,Vector=Values[c_biomass],Reference=Value&gt;+&lt;CN=Root,Model=IDModel,Vector=Values[c_glucose],Reference=Value&gt;))
    </Expression>
   </ModelValue>
   <ModelValue key="ModelValue_12" name="qp_s" simulationType="assignment">
    <Expression>
     &lt;CN=Root,Model=IDModel,Vector=Values[alpha],Reference=Value&gt;*&lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=Value&gt;/(&lt;CN=Root,Model=IDModel,Vector=Values[beta],Reference=Value&gt;+&lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=Value&gt;)
    </Expression>
   </ModelValue>
   <ModelValue key="ModelValue_13" name="qs_g" simulationType="assignment">
    <Expression>
     &lt;CN=Root,Model=IDModel,Vector=Values[a],Reference=Value&gt;*&lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=Value&gt;+&lt;CN=Root,Model=IDModel,Vector=Values[b],Reference=Value&gt;*&lt;CN=Root,Model=IDModel,Vector=Values[qp_s],Reference=Value&gt;+&lt;CN=Root,Model=IDModel,Vector=Values[ms],Reference=Value&gt;
    </Expression>
   </ModelValue>
   <ModelValue key="ModelValue_14" name="rp_s" simulationType="assignment">
    <Expression>
     &lt;CN=Root,Model=IDModel,Vector=Values[qp_s],Reference=Value&gt;*&lt;CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass],Reference=Concentration&gt;
    </Expression>
   </ModelValue>
   <ModelValue key="ModelValue_15" name="r_s" simulationType="assignment">
    <Expression>
     &lt;CN=Root,Model=IDModel,Vector=Values[qs_g],Reference=Value&gt;*&lt;CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass],Reference=Concentration&gt;
    </Expression>
   </ModelValue>
  </ListOfModelValues>
  <ListOfReactions>
   <Reaction fast="false" key="Reaction_0" name="eq_biomass" reversible="true">
    <ListOfProducts>
     <Product metabolite="Metabolite_2" stoichiometry="1"/>
    </ListOfProducts>
    <ListOfConstants>
     <Constant key="Parameter_5008" name="mu" value="0.774804"/>
    </ListOfConstants>
    <KineticLaw function="Function_39" scalingCompartment="CN=Root,Model=IDModel,Vector=Compartments[comp1]" unitType="Default">
     <ListOfCallParameters>
      <CallParameter functionParameter="FunctionParameter_254">
       <SourceParameter reference="Metabolite_2"/>
      </CallParameter>
      <CallParameter functionParameter="FunctionParameter_258">
       <SourceParameter reference="Compartment_0"/>
      </CallParameter>
      <CallParameter functionParameter="FunctionParameter_264">
       <SourceParameter reference="ModelValue_11"/>
      </CallParameter>
     </ListOfCallParameters>
    </KineticLaw>
   </Reaction>
   <Reaction fast="false" key="Reaction_1" name="eq_serine" reversible="true">
    <ListOfProducts>
     <Product metabolite="Metabolite_1" stoichiometry="1"/>
    </ListOfProducts>
    <ListOfConstants>
     <Constant key="Parameter_5007" name="rp_s" value="3.47467e-06"/>
    </ListOfConstants>
    <KineticLaw function="Function_40" scalingCompartment="CN=Root,Model=IDModel,Vector=Compartments[comp1]" unitType="Default">
     <ListOfCallParameters>
      <CallParameter functionParameter="FunctionParameter_262">
       <SourceParameter reference="Compartment_0"/>
      </CallParameter>
      <CallParameter functionParameter="FunctionParameter_265">
       <SourceParameter reference="ModelValue_14"/>
      </CallParameter>
     </ListOfCallParameters>
    </KineticLaw>
   </Reaction>
   <Reaction fast="false" key="Reaction_2" name="eq_glucose" reversible="true">
    <ListOfProducts>
     <Product metabolite="Metabolite_0" stoichiometry="1"/>
    </ListOfProducts>
    <ListOfConstants>
     <Constant key="Parameter_5006" name="r_s" value="-4.9784e-06"/>
    </ListOfConstants>
    <KineticLaw function="Function_41" scalingCompartment="CN=Root,Model=IDModel,Vector=Compartments[comp1]" unitType="Default">
     <ListOfCallParameters>
      <CallParameter functionParameter="FunctionParameter_267">
       <SourceParameter reference="Compartment_0"/>
      </CallParameter>
      <CallParameter functionParameter="FunctionParameter_266">
       <SourceParameter reference="ModelValue_15"/>
      </CallParameter>
     </ListOfCallParameters>
    </KineticLaw>
   </Reaction>
  </ListOfReactions>
  <ListOfModelParameterSets activeSet="ModelParameterSet_1">
   <ModelParameterSet key="ModelParameterSet_1" name="Initial State">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_2" name="PE: 2018-06-07 12:55:17 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="24.680700000000002"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="67.304699999999997"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.26017200000000001"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="1.0522100000000001"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.035946405942380862"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.013174546258347637"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.023925260950642131"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.499116934157221e-07"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-2.7224287760583985e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.035946405942380862">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.499116934157221e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-2.7224287760583985e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_3" name="PE: 2018-06-07 12:55:17 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.015469267967964818"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="80.812797364968063"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="28.540569620332811"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="56.087021915262333"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.085579309402421172"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="1.6364349002800629e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.026623518741724767"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.8620810330384835e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.029460522580268e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.085579309402421172">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.8620810330384835e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.029460522580268e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_4" name="PE: 2018-06-07 12:55:17 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.015469267967964818"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="80.812797364968063"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="28.540569620332811"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="56.087021915262333"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.085579309402421172"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="1.6364349002800629e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.026623518741724767"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.8620810330384835e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.029460522580268e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.085579309402421172">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.8620810330384835e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.029460522580268e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_5" name="PE: 2018-06-08 14:17:42 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="24.680700000000002"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="67.304699999999997"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.26017200000000001"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="1.0522100000000001"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.035946405942380862"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.013174546258347637"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.023925260950642131"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.499116934157221e-07"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-2.7224287760583985e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.035946405942380862">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.499116934157221e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-2.7224287760583985e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_6" name="PE: 2018-06-08 14:17:42 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.015469267967964818"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="80.812797364968063"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="28.540569620332811"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="56.087021915262333"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.085579309402421172"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="1.6364349002800629e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.026623518741724767"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.8620810330384835e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.029460522580268e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.085579309402421172">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.8620810330384835e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.029460522580268e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_7" name="PE: 2018-06-08 14:17:42 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.015469267967964818"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="80.812797364968063"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="28.540569620332811"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="56.087021915262333"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.085579309402421172"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="1.6364349002800629e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.026623518741724767"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.8620810330384835e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.029460522580268e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.085579309402421172">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.8620810330384835e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.029460522580268e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_8" name="PE: 2018-06-08 14:26:46 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.015469267967964818"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="80.812797364968063"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="28.540569620332811"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="56.087021915262333"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.085579309402421172"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="1.6364349002800629e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.026623518741724767"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.8620810330384835e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.029460522580268e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.085579309402421172">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.8620810330384835e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.029460522580268e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_9" name="PE: 2018-06-08 14:26:46 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.015469267970000001"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="80.812797364968063"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="28.540569619999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="56.087021915262333"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.085579309401423234"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="1.6364349004762947e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.026623518741469596"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.8620810332617734e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.0294605225512327e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.085579309401423234">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.8620810332617734e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.0294605225512327e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_10" name="PE: 2018-06-08 14:26:46 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.015469267970000001"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="80.812797364968063"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="28.540569619999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="56.087021915262333"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.085579309401423234"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="1.6364349004762947e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.026623518741469596"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.8620810332617734e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.0294605225512327e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.085579309401423234">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.8620810332617734e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.0294605225512327e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_11" name="PE: 2018-06-10 09:42:38 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.015469267970000001"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="80.812797364968063"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="28.540569619999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="56.087021915262333"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.085579309401423234"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="1.6364349004762947e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.026623518741469596"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="1.8620810332617734e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.0294605225512327e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.085579309401423234">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="1.8620810332617734e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.0294605225512327e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_12" name="PE: 2018-06-10 09:42:38 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.066421553508011058"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="91.007261278807945"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="51.399099640873985"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="94.166779633184618"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.091907984325952485"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="6.7011270773356427e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.028290003891903674"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="7.6251378093633844e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.2190880103255708e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.091907984325952485">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="7.6251378093633844e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.2190880103255708e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_13" name="PE: 2018-06-10 09:42:38 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.066421553508011058"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="91.007261278807945"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="51.399099640873985"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="94.166779633184618"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.091907984325952485"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="6.7011270773356427e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.028290003891903674"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="7.6251378093633844e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.2190880103255708e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.091907984325952485">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="7.6251378093633844e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.2190880103255708e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_14" name="PE: 2018-06-10 09:53:04 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.066421553508011058"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="91.007261278807945"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="51.399099640873985"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="94.166779633184618"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.091907984325952485"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="6.7011270773356427e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.028290003891903674"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="7.6251378093633844e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.2190880103255708e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.091907984325952485">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="7.6251378093633844e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.2190880103255708e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_15" name="PE: 2018-06-10 09:53:04 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.066421553509999995"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="91.007261278807945"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="60"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="94.166779633184618"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.10728746414016721"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="7.8211439760764439e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.032254175349411968"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="8.8995925545358954e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.6701666619404571e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.10728746414016721">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="8.8995925545358954e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.6701666619404571e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_16" name="PE: 2018-06-10 09:53:04 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="1.1559087096315254e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="2.3860969612451564e+18"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.066421553509999995"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="91.007261278807945"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="60"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="94.166779633184618"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="0.018629828614371832"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.10728746414016721"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="7.8211439760764439e-05"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.032254175349411968"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="8.8995925545358954e-10"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-3.6701666619404571e-07"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.10728746414016721">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="8.8995925545358954e-10">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-3.6701666619404571e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_17" name="PE: 2018-06-11 16:14:28 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="0.066421553509999995"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="91.007261278807945"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="60"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="94.166779633184618"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="53.100745218673659"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.024474934291903113"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-13.680837442469599"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="2.7849754928849462e-07"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-0.00015567272436774321"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="53.100745218673659">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="2.7849754928849462e-07">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-0.00015567272436774321">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_18" name="PE: 2018-06-11 16:14:28 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.061284365379553"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="68.764634562834317"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.97249813866161239"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="7.4838347517614796"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.96255884941634717"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.40118058783628441"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.55911340382342567"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="4.5649891926976512e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-6.3620891023468686e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.96255884941634717">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="4.5649891926976512e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-6.3620891023468686e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_19" name="PE: 2018-06-11 16:14:28 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.061284365379553"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="68.764634562834317"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.97249813866161239"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="7.4838347517614796"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.96255884941634717"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.40118058783628441"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.55911340382342567"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="4.5649891926976512e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-6.3620891023468686e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.96255884941634717">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="4.5649891926976512e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-6.3620891023468686e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_20" name="PE: 2018-06-11 16:40:31 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.061284365379553"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="68.764634562834317"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.97249813866161239"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="7.4838347517614796"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.96255884941634717"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.40118058783628441"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.55911340382342567"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="4.5649891926976512e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-6.3620891023468686e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.96255884941634717">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="4.5649891926976512e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-6.3620891023468686e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_21" name="PE: 2018-06-11 16:40:31 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.061284365379553"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="68.764634562834317"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.97249813866161239"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="7.4838347517614796"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.96255884941634717"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.40118058783628441"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.55911340382342567"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="4.5649891926976512e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-6.3620891023468686e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.96255884941634717">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="4.5649891926976512e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-6.3620891023468686e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_22" name="PE: 2018-06-11 16:40:31 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.061284365379553"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="68.764634562834317"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.97249813866161239"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="7.4838347517614796"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.96255884941634717"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.40118058783628441"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.55911340382342567"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="4.5649891926976512e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-6.3620891023468686e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.96255884941634717">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="4.5649891926976512e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-6.3620891023468686e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_23" name="PE: 2018-07-09 16:53:31 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.061284365379553"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="68.764634562834317"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.97249813866161239"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="7.4838347517614796"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.96255884941634717"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.40118058783628441"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.55911340382342567"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="4.5649891926976512e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-6.3620891023468686e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.96255884941634717">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="4.5649891926976512e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-6.3620891023468686e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_24" name="PE: 2018-07-09 16:53:31 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.061284365379553"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="68.764634562834317"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.97249813866161239"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="7.4838347517614796"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.96255884941634717"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.40118058783628441"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.55911340382342567"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="4.5649891926976512e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-6.3620891023468686e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.96255884941634717">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="4.5649891926976512e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-6.3620891023468686e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_25" name="PE: 2018-07-09 16:53:31 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.061284365379553"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="68.764634562834317"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.97249813866161239"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="7.4838347517614796"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.96255884941634717"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.40118058783628441"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.55911340382342567"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="4.5649891926976512e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-6.3620891023468686e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.96255884941634717">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="4.5649891926976512e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-6.3620891023468686e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_26" name="PE: 2018-07-09 17:03:50 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.061284365379553"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="68.764634562834317"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.97249813866161239"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="7.4838347517614796"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.96255884941634717"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.40118058783628441"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.55911340382342567"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="4.5649891926976512e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-6.3620891023468686e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.96255884941634717">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="4.5649891926976512e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-6.3620891023468686e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_27" name="PE: 2018-07-09 17:03:50 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_28" name="PE: 2018-07-09 17:03:50 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_29" name="PE: 2018-07-09 17:13:18 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_30" name="PE: 2018-07-09 17:13:18 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_31" name="PE: 2018-07-09 17:13:18 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_32" name="PE: 2018-07-09 17:16:58 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_33" name="PE: 2018-07-09 17:16:58 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_34" name="PE: 2018-07-09 17:16:58 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_35" name="PE: 2018-07-09 17:20:26 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_36" name="PE: 2018-07-09 17:20:26 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_37" name="PE: 2018-07-09 17:20:26 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_38" name="PE: 2018-07-09 17:34:08 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_39" name="PE: 2018-07-09 17:34:08 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_40" name="PE: 2018-07-09 17:34:08 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_41" name="PE: 2018-07-09 17:36:33 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_42" name="PE: 2018-07-09 17:36:33 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_43" name="PE: 2018-07-09 17:36:33 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_44" name="PE: 2018-07-09 17:38:19 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_45" name="PE: 2018-07-09 17:38:19 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_46" name="PE: 2018-07-09 17:38:19 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_47" name="PE: 2018-07-09 17:39:40 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_48" name="PE: 2018-07-09 17:39:40 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_49" name="PE: 2018-07-09 17:39:40 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_50" name="PE: 2018-07-09 17:41:19 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_51" name="PE: 2018-07-09 17:41:19 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_52" name="PE: 2018-07-09 17:41:19 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_53" name="PE: 2018-07-09 17:42:52 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_54" name="PE: 2018-07-09 17:42:52 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_55" name="PE: 2018-07-09 17:42:52 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_56" name="PE: 2018-07-09 17:44:16 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_57" name="PE: 2018-07-09 17:44:16 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_58" name="PE: 2018-07-09 17:44:16 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_59" name="PE: 2018-07-09 17:47:17 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_60" name="PE: 2018-07-09 17:47:17 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_61" name="PE: 2018-07-09 17:47:17 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_62" name="PE: 2018-07-10 07:01:09 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_63" name="PE: 2018-07-10 07:01:09 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_64" name="PE: 2018-07-10 07:01:09 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_65" name="PE: 2018-07-10 07:03:46 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_66" name="PE: 2018-07-10 07:03:46 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_67" name="PE: 2018-07-10 07:03:46 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_68" name="PE: 2018-07-10 07:35:20 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_69" name="PE: 2018-07-10 07:35:20 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_70" name="PE: 2018-07-10 07:35:20 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_71" name="PE: 2018-07-10 07:36:57 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_72" name="PE: 2018-07-10 07:36:57 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_73" name="PE: 2018-07-10 07:36:57 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_74" name="PE: 2018-07-10 07:43:05 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_75" name="PE: 2018-07-10 07:43:05 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_76" name="PE: 2018-07-10 07:43:05 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_77" name="PE: 2018-07-10 07:47:31 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_78" name="PE: 2018-07-10 07:47:31 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_79" name="PE: 2018-07-10 07:47:31 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_80" name="PE: 2018-07-10 07:48:29 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_81" name="PE: 2018-07-10 07:48:29 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_82" name="PE: 2018-07-10 07:48:29 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_83" name="PE: 2018-07-10 07:50:45 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_84" name="PE: 2018-07-10 07:50:45 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_85" name="PE: 2018-07-10 07:50:45 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_86" name="PE: 2018-07-10 07:56:05 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_87" name="PE: 2018-07-10 07:56:05 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_88" name="PE: 2018-07-10 07:56:05 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_89" name="PE: 2018-07-10 07:57:06 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_90" name="PE: 2018-07-10 07:57:06 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_91" name="PE: 2018-07-10 07:57:06 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_92" name="PE: 2018-07-10 07:59:20 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_93" name="PE: 2018-07-10 07:59:20 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_94" name="PE: 2018-07-10 07:59:20 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_95" name="PE: 2018-07-10 08:07:58 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_96" name="PE: 2018-07-10 08:07:58 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_97" name="PE: 2018-07-10 08:07:58 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_98" name="PE: 2018-07-10 08:12:43 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_99" name="PE: 2018-07-10 08:12:43 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_100" name="PE: 2018-07-10 08:12:43 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_101" name="PE: 2018-07-10 08:14:15 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_102" name="PE: 2018-07-10 08:14:15 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_103" name="PE: 2018-07-10 08:14:15 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_0" name="PE: 2018-07-10 08:15:45 Exp: Original">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_104" name="PE: 2018-07-10 08:15:45 Exp: Experiment">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
   <ModelParameterSet key="ModelParameterSet_105" name="PE: 2018-07-10 08:15:45 Exp: Experiment_1">
    <ModelParameterGroup cn="String=Initial Time" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel" simulationType="time" type="Model" value="0"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" simulationType="fixed" type="Compartment" value="1"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Species Values" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" simulationType="reactions" type="Species" value="4.9664603342130003e+21"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" simulationType="reactions" type="Species" value="0"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" simulationType="reactions" type="Species" value="6.8525280189931684e+18"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" simulationType="fixed" type="ModelValue" value="29.97805882477622"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" simulationType="fixed" type="ModelValue" value="75.289599405436221"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" simulationType="fixed" type="ModelValue" value="0.78024053964303819"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" simulationType="fixed" type="ModelValue" value="5.0851372548111566"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" simulationType="fixed" type="ModelValue" value="-0.25719999999999998"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" simulationType="fixed" type="ModelValue" value="-0.7651"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" simulationType="fixed" type="ModelValue" value="-0.0045999999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" simulationType="fixed" type="ModelValue" value="0.00010428"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" simulationType="assignment" type="ModelValue" value="0.00010302999999999999"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" simulationType="assignment" type="ModelValue" value="80.044647190138804"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" simulationType="assignment" type="ModelValue" value="0.11044247829027858"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" simulationType="assignment" type="ModelValue" value="0.77480430052952043"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" simulationType="assignment" type="ModelValue" value="0.30536134863753422"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" simulationType="assignment" type="ModelValue" value="-0.43751163393877007"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" simulationType="assignment" type="ModelValue" value="3.4746727500354068e-06"/>
     <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" simulationType="assignment" type="ModelValue" value="-4.9783961167757631e-06"/>
    </ModelParameterGroup>
    <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" simulationType="assignment" type="ReactionParameter" value="0.77480430052952043">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" simulationType="assignment" type="ReactionParameter" value="3.4746727500354068e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
     <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
      <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" simulationType="assignment" type="ReactionParameter" value="-4.9783961167757631e-06">
       <InitialExpression>
        &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue&gt;
       </InitialExpression>
      </ModelParameter>
     </ModelParameterGroup>
    </ModelParameterGroup>
   </ModelParameterSet>
  </ListOfModelParameterSets>
  <StateTemplate>
   <StateTemplateVariable objectReference="Model_1"/>
   <StateTemplateVariable objectReference="Metabolite_0"/>
   <StateTemplateVariable objectReference="Metabolite_1"/>
   <StateTemplateVariable objectReference="Metabolite_2"/>
   <StateTemplateVariable objectReference="ModelValue_8"/>
   <StateTemplateVariable objectReference="ModelValue_9"/>
   <StateTemplateVariable objectReference="ModelValue_10"/>
   <StateTemplateVariable objectReference="ModelValue_11"/>
   <StateTemplateVariable objectReference="ModelValue_12"/>
   <StateTemplateVariable objectReference="ModelValue_13"/>
   <StateTemplateVariable objectReference="ModelValue_14"/>
   <StateTemplateVariable objectReference="ModelValue_15"/>
   <StateTemplateVariable objectReference="Compartment_0"/>
   <StateTemplateVariable objectReference="ModelValue_0"/>
   <StateTemplateVariable objectReference="ModelValue_1"/>
   <StateTemplateVariable objectReference="ModelValue_2"/>
   <StateTemplateVariable objectReference="ModelValue_3"/>
   <StateTemplateVariable objectReference="ModelValue_4"/>
   <StateTemplateVariable objectReference="ModelValue_5"/>
   <StateTemplateVariable objectReference="ModelValue_6"/>
   <StateTemplateVariable objectReference="ModelValue_7"/>
  </StateTemplate>
  <InitialState type="initialState">
   0 4.9664603342130003e+21 0 6.8525280189931684e+18 0.00010302999999999999 80.044647190138804 0.11044247829027858 0.77480430052952043 0.30536134863753422 -0.43751163393877007 3.4746727500354068e-06 -4.9783961167757631e-06 1 29.97805882477622 75.289599405436221 0.78024053964303819 5.0851372548111566 -0.25719999999999998 -0.7651 -0.0045999999999999999 0.00010428
  </InitialState>
 </Model>
 <ListOfTasks>
  <Task key="Task_14" name="Steady-State" scheduled="false" type="steadyState" updateModel="false">
   <Report append="1" confirmOverwrite="1" reference="Report_9" target=""/>
   <Problem>
    <Parameter name="JacobianRequested" type="bool" value="1"/>
    <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
   </Problem>
   <Method name="Enhanced Newton" type="EnhancedNewton">
    <Parameter name="Resolution" type="unsignedFloat" value="1.0000000000000001e-09"/>
    <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
    <Parameter name="Use Newton" type="bool" value="1"/>
    <Parameter name="Use Integration" type="bool" value="1"/>
    <Parameter name="Use Back Integration" type="bool" value="0"/>
    <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
    <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
    <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
    <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
   </Method>
  </Task>
  <Task key="Task_15" name="Time-Course" scheduled="false" type="timeCourse" updateModel="false">
   <Problem>
    <Parameter name="AutomaticStepSize" type="bool" value="0"/>
    <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
    <Parameter name="StepSize" type="float" value="0.01"/>
    <Parameter name="Duration" type="float" value="1"/>
    <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
    <Parameter name="OutputStartTime" type="float" value="0"/>
    <Parameter name="Output Event" type="bool" value="0"/>
    <Parameter name="Start in Steady State" type="bool" value="0"/>
   </Problem>
   <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
    <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
    <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
    <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
    <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
    <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
   </Method>
  </Task>
  <Task key="Task_16" name="Scan" scheduled="false" type="scan" updateModel="false">
   <Problem>
    <Parameter name="Subtask" type="unsignedInteger" value="1"/>
    <ParameterGroup name="ScanItems">
    </ParameterGroup>
    <Parameter name="Output in subtask" type="bool" value="1"/>
    <Parameter name="Adjust initial conditions" type="bool" value="0"/>
   </Problem>
   <Method name="Scan Framework" type="ScanFramework">
   </Method>
  </Task>
  <Task key="Task_17" name="Elementary Flux Modes" scheduled="false" type="fluxMode" updateModel="false">
   <Report append="1" confirmOverwrite="1" reference="Report_10" target=""/>
   <Problem>
   </Problem>
   <Method name="EFM Algorithm" type="EFMAlgorithm">
   </Method>
  </Task>
  <Task key="Task_18" name="Optimization" scheduled="false" type="optimization" updateModel="false">
   <Report append="1" confirmOverwrite="1" reference="Report_11" target=""/>
   <Problem>
    <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
    <ParameterText name="ObjectiveExpression" type="expression">
    </ParameterText>
    <Parameter name="Maximize" type="bool" value="0"/>
    <Parameter name="Randomize Start Values" type="bool" value="0"/>
    <Parameter name="Calculate Statistics" type="bool" value="1"/>
    <ParameterGroup name="OptimizationItemList">
    </ParameterGroup>
    <ParameterGroup name="OptimizationConstraintList">
    </ParameterGroup>
   </Problem>
   <Method name="Random Search" type="RandomSearch">
    <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
    <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
    <Parameter name="Seed" type="unsignedInteger" value="0"/>
    <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
   </Method>
  </Task>
  <Task key="Task_19" name="Parameter Estimation" scheduled="true" type="parameterFitting" updateModel="true">
   <Report append="1" confirmOverwrite="1" reference="Report_12" target="PARAMETERTEST"/>
   <Problem>
    <Parameter name="Maximize" type="bool" value="0"/>
    <Parameter name="Randomize Start Values" type="bool" value="0"/>
    <Parameter name="Calculate Statistics" type="bool" value="0"/>
    <ParameterGroup name="OptimizationItemList">
     <ParameterGroup name="FitItem">
      <ParameterGroup name="Affected Cross Validation Experiments">
      </ParameterGroup>
      <ParameterGroup name="Affected Experiments">
      </ParameterGroup>
      <Parameter name="LowerBound" type="cn" value="0"/>
      <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel,Vector=Values[alpha],Reference=InitialValue"/>
      <Parameter name="StartValue" type="float" value="29.97805882477622"/>
      <Parameter name="UpperBound" type="cn" value="100"/>
     </ParameterGroup>
     <ParameterGroup name="FitItem">
      <ParameterGroup name="Affected Cross Validation Experiments">
      </ParameterGroup>
      <ParameterGroup name="Affected Experiments">
      </ParameterGroup>
      <Parameter name="LowerBound" type="cn" value="0"/>
      <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel,Vector=Values[beta],Reference=InitialValue"/>
      <Parameter name="StartValue" type="float" value="75.289599405436221"/>
      <Parameter name="UpperBound" type="cn" value="100"/>
     </ParameterGroup>
     <ParameterGroup name="FitItem">
      <ParameterGroup name="Affected Cross Validation Experiments">
      </ParameterGroup>
      <ParameterGroup name="Affected Experiments">
      </ParameterGroup>
      <Parameter name="LowerBound" type="cn" value="0"/>
      <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel,Vector=Values[kc],Reference=InitialValue"/>
      <Parameter name="StartValue" type="float" value="5.0851372548111566"/>
      <Parameter name="UpperBound" type="cn" value="100"/>
     </ParameterGroup>
     <ParameterGroup name="FitItem">
      <ParameterGroup name="Affected Cross Validation Experiments">
      </ParameterGroup>
      <ParameterGroup name="Affected Experiments">
      </ParameterGroup>
      <Parameter name="LowerBound" type="cn" value="0"/>
      <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel,Vector=Values[mu_max],Reference=InitialValue"/>
      <Parameter name="StartValue" type="float" value="0.78024053964303819"/>
      <Parameter name="UpperBound" type="cn" value="100"/>
     </ParameterGroup>
    </ParameterGroup>
    <ParameterGroup name="OptimizationConstraintList">
    </ParameterGroup>
    <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
    <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
    <Parameter name="Create Parameter Sets" type="bool" value="1"/>
    <ParameterGroup name="Experiment Set">
     <ParameterGroup name="Experiment">
      <Parameter name="Data is Row Oriented" type="bool" value="1"/>
      <Parameter name="Experiment Type" type="unsignedInteger" value="1"/>
      <Parameter name="File Name" type="file" value="R1_data_in_moles.csv"/>
      <Parameter name="First Row" type="unsignedInteger" value="1"/>
      <Parameter name="Key" type="key" value="Experiment_0"/>
      <Parameter name="Last Row" type="unsignedInteger" value="14"/>
      <Parameter name="Normalize Weights per Experiment" type="bool" value="1"/>
      <Parameter name="Number of Columns" type="unsignedInteger" value="4"/>
      <ParameterGroup name="Object Map">
       <ParameterGroup name="0">
        <Parameter name="Role" type="unsignedInteger" value="3"/>
       </ParameterGroup>
       <ParameterGroup name="1">
        <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass],Reference=Concentration"/>
        <Parameter name="Role" type="unsignedInteger" value="2"/>
       </ParameterGroup>
       <ParameterGroup name="2">
        <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose],Reference=Concentration"/>
        <Parameter name="Role" type="unsignedInteger" value="2"/>
       </ParameterGroup>
       <ParameterGroup name="3">
        <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine],Reference=Concentration"/>
        <Parameter name="Role" type="unsignedInteger" value="2"/>
       </ParameterGroup>
      </ParameterGroup>
      <Parameter name="Row containing Names" type="unsignedInteger" value="1"/>
      <Parameter name="Separator" type="string" value=","/>
      <Parameter name="Weight Method" type="unsignedInteger" value="1"/>
     </ParameterGroup>
     <ParameterGroup name="Experiment_1">
      <Parameter name="Data is Row Oriented" type="bool" value="1"/>
      <Parameter name="Experiment Type" type="unsignedInteger" value="1"/>
      <Parameter name="File Name" type="file" value="R2_data_in_moles.csv"/>
      <Parameter name="First Row" type="unsignedInteger" value="1"/>
      <Parameter name="Key" type="key" value="Experiment_1"/>
      <Parameter name="Last Row" type="unsignedInteger" value="14"/>
      <Parameter name="Normalize Weights per Experiment" type="bool" value="1"/>
      <Parameter name="Number of Columns" type="unsignedInteger" value="4"/>
      <ParameterGroup name="Object Map">
       <ParameterGroup name="0">
        <Parameter name="Role" type="unsignedInteger" value="3"/>
       </ParameterGroup>
       <ParameterGroup name="1">
        <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass],Reference=Concentration"/>
        <Parameter name="Role" type="unsignedInteger" value="2"/>
       </ParameterGroup>
       <ParameterGroup name="2">
        <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose],Reference=Concentration"/>
        <Parameter name="Role" type="unsignedInteger" value="2"/>
       </ParameterGroup>
       <ParameterGroup name="3">
        <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine],Reference=Concentration"/>
        <Parameter name="Role" type="unsignedInteger" value="2"/>
       </ParameterGroup>
      </ParameterGroup>
      <Parameter name="Row containing Names" type="unsignedInteger" value="1"/>
      <Parameter name="Separator" type="string" value=","/>
      <Parameter name="Weight Method" type="unsignedInteger" value="1"/>
     </ParameterGroup>
    </ParameterGroup>
    <ParameterGroup name="Validation Set">
     <Parameter name="Threshold" type="unsignedInteger" value="5"/>
     <Parameter name="Weight" type="unsignedFloat" value="1"/>
    </ParameterGroup>
   </Problem>
   <Method name="Random Search" type="RandomSearch">
    <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
    <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
    <Parameter name="Seed" type="unsignedInteger" value="0"/>
    <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
   </Method>
  </Task>
  <Task key="Task_20" name="Metabolic Control Analysis" scheduled="false" type="metabolicControlAnalysis" updateModel="false">
   <Report append="1" confirmOverwrite="1" reference="Report_13" target=""/>
   <Problem>
    <Parameter name="Steady-State" type="key" value="Task_14"/>
   </Problem>
   <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
    <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
    <Parameter name="Use Reder" type="bool" value="1"/>
    <Parameter name="Use Smallbone" type="bool" value="1"/>
   </Method>
  </Task>
  <Task key="Task_21" name="Lyapunov Exponents" scheduled="false" type="lyapunovExponents" updateModel="false">
   <Report append="1" confirmOverwrite="1" reference="Report_14" target=""/>
   <Problem>
    <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
    <Parameter name="DivergenceRequested" type="bool" value="1"/>
    <Parameter name="TransientTime" type="float" value="0"/>
   </Problem>
   <Method name="Wolf Method" type="WolfMethod">
    <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
    <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
    <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
    <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
    <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
   </Method>
  </Task>
  <Task key="Task_22" name="Time Scale Separation Analysis" scheduled="false" type="timeScaleSeparationAnalysis" updateModel="false">
   <Report append="1" confirmOverwrite="1" reference="Report_15" target=""/>
   <Problem>
    <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
    <Parameter name="StepSize" type="float" value="0.01"/>
    <Parameter name="Duration" type="float" value="1"/>
    <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
    <Parameter name="OutputStartTime" type="float" value="0"/>
   </Problem>
   <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
    <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="0.0001"/>
   </Method>
  </Task>
  <Task key="Task_23" name="Sensitivities" scheduled="false" type="sensitivities" updateModel="false">
   <Report append="1" confirmOverwrite="1" reference="Report_16" target=""/>
   <Problem>
    <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
    <ParameterGroup name="TargetFunctions">
     <Parameter name="SingleObject" type="cn" value=""/>
     <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
    </ParameterGroup>
    <ParameterGroup name="ListOfVariables">
     <ParameterGroup name="Variables">
      <Parameter name="SingleObject" type="cn" value=""/>
      <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
     </ParameterGroup>
     <ParameterGroup name="Variables">
      <Parameter name="SingleObject" type="cn" value=""/>
      <Parameter name="ObjectListType" type="unsignedInteger" value="0"/>
     </ParameterGroup>
    </ParameterGroup>
   </Problem>
   <Method name="Sensitivities Method" type="SensitivitiesMethod">
    <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
    <Parameter name="Delta minimum" type="unsignedFloat" value="9.9999999999999998e-13"/>
   </Method>
  </Task>
  <Task key="Task_24" name="Moieties" scheduled="false" type="moieties" updateModel="false">
   <Problem>
   </Problem>
   <Method name="Householder Reduction" type="Householder">
   </Method>
  </Task>
  <Task key="Task_25" name="Cross Section" scheduled="false" type="crosssection" updateModel="false">
   <Problem>
    <Parameter name="AutomaticStepSize" type="bool" value="0"/>
    <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
    <Parameter name="StepSize" type="float" value="0.01"/>
    <Parameter name="Duration" type="float" value="1"/>
    <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
    <Parameter name="OutputStartTime" type="float" value="0"/>
    <Parameter name="Output Event" type="bool" value="0"/>
    <Parameter name="Start in Steady State" type="bool" value="0"/>
    <Parameter name="LimitCrossings" type="bool" value="0"/>
    <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
    <Parameter name="LimitOutTime" type="bool" value="0"/>
    <Parameter name="LimitOutCrossings" type="bool" value="0"/>
    <Parameter name="PositiveDirection" type="bool" value="1"/>
    <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
    <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
    <Parameter name="ConvergenceTolerance" type="float" value="0"/>
    <Parameter name="Threshold" type="float" value="0"/>
    <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
    <Parameter name="OutputConvergenceTolerance" type="float" value="0"/>
    <ParameterText name="TriggerExpression" type="expression">
    </ParameterText>
    <Parameter name="SingleVariable" type="cn" value=""/>
   </Problem>
   <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
    <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
    <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
    <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
    <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
    <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
   </Method>
  </Task>
  <Task key="Task_26" name="Linear Noise Approximation" scheduled="false" type="linearNoiseApproximation" updateModel="false">
   <Report append="1" confirmOverwrite="1" reference="Report_17" target=""/>
   <Problem>
    <Parameter name="Steady-State" type="key" value=""/>
   </Problem>
   <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
   </Method>
  </Task>
 </ListOfTasks>
 <ListOfReports>
  <Report key="Report_9" name="Steady-State" precision="6" separator=" " taskType="steadyState">
   <Comment>
    Automatically generated report.
   </Comment>
   <Footer>
    <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
   </Footer>
  </Report>
  <Report key="Report_10" name="Elementary Flux Modes" precision="6" separator=" " taskType="fluxMode">
   <Comment>
    Automatically generated report.
   </Comment>
   <Footer>
    <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
   </Footer>
  </Report>
  <Report key="Report_11" name="Optimization" precision="6" separator=" " taskType="optimization">
   <Comment>
    Automatically generated report.
   </Comment>
   <Header>
    <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
    <Object cn="String=\[Function Evaluations\]"/>
    <Object cn="Separator= "/>
    <Object cn="String=\[Best Value\]"/>
    <Object cn="Separator= "/>
    <Object cn="String=\[Best Parameters\]"/>
   </Header>
   <Body>
    <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
    <Object cn="Separator= "/>
    <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
    <Object cn="Separator= "/>
    <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
   </Body>
   <Footer>
    <Object cn="String= "/>
    <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
   </Footer>
  </Report>
  <Report key="Report_12" name="Parameter Estimation" precision="6" separator=" " taskType="parameterFitting">
   <Comment>
    Automatically generated report.
   </Comment>
   <Header>
    <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
    <Object cn="String=\[Function Evaluations\]"/>
    <Object cn="Separator= "/>
    <Object cn="String=\[Best Value\]"/>
    <Object cn="Separator= "/>
    <Object cn="String=\[Best Parameters\]"/>
   </Header>
   <Body>
    <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
    <Object cn="Separator= "/>
    <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
    <Object cn="Separator= "/>
    <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
   </Body>
   <Footer>
    <Object cn="String= "/>
    <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
   </Footer>
  </Report>
  <Report key="Report_13" name="Metabolic Control Analysis" precision="6" separator=" " taskType="metabolicControlAnalysis">
   <Comment>
    Automatically generated report.
   </Comment>
   <Header>
    <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
   </Header>
   <Footer>
    <Object cn="String= "/>
    <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
   </Footer>
  </Report>
  <Report key="Report_14" name="Lyapunov Exponents" precision="6" separator=" " taskType="lyapunovExponents">
   <Comment>
    Automatically generated report.
   </Comment>
   <Header>
    <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
   </Header>
   <Footer>
    <Object cn="String= "/>
    <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
   </Footer>
  </Report>
  <Report key="Report_15" name="Time Scale Separation Analysis" precision="6" separator=" " taskType="timeScaleSeparationAnalysis">
   <Comment>
    Automatically generated report.
   </Comment>
   <Header>
    <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
   </Header>
   <Footer>
    <Object cn="String= "/>
    <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
   </Footer>
  </Report>
  <Report key="Report_16" name="Sensitivities" precision="6" separator=" " taskType="sensitivities">
   <Comment>
    Automatically generated report.
   </Comment>
   <Header>
    <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
   </Header>
   <Footer>
    <Object cn="String= "/>
    <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
   </Footer>
  </Report>
  <Report key="Report_17" name="Linear Noise Approximation" precision="6" separator=" " taskType="linearNoiseApproximation">
   <Comment>
    Automatically generated report.
   </Comment>
   <Header>
    <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
   </Header>
   <Footer>
    <Object cn="String= "/>
    <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
   </Footer>
  </Report>
 </ListOfReports>
 <SBMLReference file="SerineModel.xml">
  <SBMLMap COPASIkey="ModelValue_4" SBMLid="a"/>
  <SBMLMap COPASIkey="ModelValue_0" SBMLid="alpha"/>
  <SBMLMap COPASIkey="ModelValue_5" SBMLid="b"/>
  <SBMLMap COPASIkey="ModelValue_1" SBMLid="beta"/>
  <SBMLMap COPASIkey="Metabolite_2" SBMLid="biomass"/>
  <SBMLMap COPASIkey="ModelValue_10" SBMLid="c_biomass"/>
  <SBMLMap COPASIkey="ModelValue_9" SBMLid="c_glucose"/>
  <SBMLMap COPASIkey="Compartment_0" SBMLid="comp1"/>
  <SBMLMap COPASIkey="Reaction_0" SBMLid="eq_biomass"/>
  <SBMLMap COPASIkey="Reaction_2" SBMLid="eq_glucose"/>
  <SBMLMap COPASIkey="Reaction_1" SBMLid="eq_serine"/>
  <SBMLMap COPASIkey="Metabolite_0" SBMLid="glucose"/>
  <SBMLMap COPASIkey="ModelValue_3" SBMLid="kc"/>
  <SBMLMap COPASIkey="ModelValue_6" SBMLid="ms"/>
  <SBMLMap COPASIkey="ModelValue_11" SBMLid="mu"/>
  <SBMLMap COPASIkey="ModelValue_2" SBMLid="mu_max"/>
  <SBMLMap COPASIkey="ModelValue_12" SBMLid="qp_s"/>
  <SBMLMap COPASIkey="ModelValue_13" SBMLid="qs_g"/>
  <SBMLMap COPASIkey="ModelValue_15" SBMLid="r_s"/>
  <SBMLMap COPASIkey="ModelValue_14" SBMLid="rp_s"/>
  <SBMLMap COPASIkey="Metabolite_1" SBMLid="serine"/>
  <SBMLMap COPASIkey="ModelValue_8" SBMLid="v"/>
  <SBMLMap COPASIkey="ModelValue_7" SBMLid="v0"/>
 </SBMLReference>
 <ListOfUnitDefinitions>
  <UnitDefinition key="Unit_0" name="meter" symbol="m">
   <Expression>
    m
   </Expression>
  </UnitDefinition>
  <UnitDefinition key="Unit_2" name="second" symbol="s">
   <Expression>
    s
   </Expression>
  </UnitDefinition>
  <UnitDefinition key="Unit_6" name="Avogadro" symbol="Avogadro">
   <Expression>
    Avogadro
   </Expression>
  </UnitDefinition>
  <UnitDefinition key="Unit_8" name="item" symbol="#">
   <Expression>
    #
   </Expression>
  </UnitDefinition>
 </ListOfUnitDefinitions>
</COPASI>