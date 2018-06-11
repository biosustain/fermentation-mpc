<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.22 (Build 170) (http://www.copasi.org) at 2018-06-11 09:31:44 UTC -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="22" versionDevel="170" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_39" name="Function for eq_biomass" type="UserDefined" reversible="true">
      <Expression>
        mu*biomass/comp1
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_254" name="biomass" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_258" name="comp1" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_264" name="mu" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_40" name="Function for eq_serine" type="UserDefined" reversible="unspecified">
      <Expression>
        rp_s/comp1
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_262" name="comp1" order="0" role="volume"/>
        <ParameterDescription key="FunctionParameter_265" name="rp_s" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="Function for eq_glucose" type="UserDefined" reversible="unspecified">
      <Expression>
        r_s/comp1
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_267" name="comp1" order="0" role="volume"/>
        <ParameterDescription key="FunctionParameter_266" name="r_s" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_1" name="IDModel" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mol" type="deterministic" avogadroConstant="6.0221417899999999e+23">
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
      <Compartment key="Compartment_0" name="comp1" simulationType="fixed" dimensionality="3">
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_0" name="glucose" simulationType="reactions" compartment="Compartment_0">
      </Metabolite>
      <Metabolite key="Metabolite_1" name="serine" simulationType="reactions" compartment="Compartment_0">
      </Metabolite>
      <Metabolite key="Metabolite_2" name="biomass" simulationType="reactions" compartment="Compartment_0">
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
          0.00010302999999999999-1.2099999999999998e-06*&lt;CN=Root,Model=IDModel,Reference=Time>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_9" name="c_glucose" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose],Reference=Concentration>/&lt;CN=Root,Model=IDModel,Vector=Values[v],Reference=Value>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_10" name="c_biomass" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass],Reference=Concentration>/&lt;CN=Root,Model=IDModel,Vector=Values[v],Reference=Value>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_11" name="mu" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=IDModel,Vector=Values[mu_max],Reference=Value>*(&lt;CN=Root,Model=IDModel,Vector=Values[c_glucose],Reference=Value>/(&lt;CN=Root,Model=IDModel,Vector=Values[kc],Reference=Value>*&lt;CN=Root,Model=IDModel,Vector=Values[c_biomass],Reference=Value>+&lt;CN=Root,Model=IDModel,Vector=Values[c_glucose],Reference=Value>))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_12" name="qp_s" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=IDModel,Vector=Values[alpha],Reference=Value>*&lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=Value>/(&lt;CN=Root,Model=IDModel,Vector=Values[beta],Reference=Value>+&lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=Value>)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_13" name="qs_g" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=IDModel,Vector=Values[a],Reference=Value>*&lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=Value>+&lt;CN=Root,Model=IDModel,Vector=Values[b],Reference=Value>*&lt;CN=Root,Model=IDModel,Vector=Values[qp_s],Reference=Value>+&lt;CN=Root,Model=IDModel,Vector=Values[ms],Reference=Value>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_14" name="rp_s" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=IDModel,Vector=Values[qp_s],Reference=Value>*&lt;CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass],Reference=Concentration>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_15" name="r_s" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=IDModel,Vector=Values[qs_g],Reference=Value>*&lt;CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass],Reference=Concentration>
        </Expression>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="eq_biomass" reversible="true" fast="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5008" name="mu" value="0.0855793"/>
        </ListOfConstants>
        <KineticLaw function="Function_39" unitType="Default" scalingCompartment="CN=Root,Model=IDModel,Vector=Compartments[comp1]">
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
      <Reaction key="Reaction_1" name="eq_serine" reversible="true" fast="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5007" name="rp_s" value="1.86208e-10"/>
        </ListOfConstants>
        <KineticLaw function="Function_40" unitType="Default" scalingCompartment="CN=Root,Model=IDModel,Vector=Compartments[comp1]">
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
      <Reaction key="Reaction_2" name="eq_glucose" reversible="true" fast="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5006" name="r_s" value="-3.02946e-07"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=IDModel,Vector=Compartments[comp1]">
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
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_2" name="PE: 2018-06-07 12:55:17 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="24.680700000000002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="67.304699999999997" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="0.26017200000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="1.0522100000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.035946405942380862" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="0.013174546258347637" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.023925260950642131" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.499116934157221e-07" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-2.7224287760583985e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.035946405942380862" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.499116934157221e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-2.7224287760583985e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_3" name="PE: 2018-06-07 12:55:17 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_4" name="PE: 2018-06-07 12:55:17 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_5" name="PE: 2018-06-08 14:17:42 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="24.680700000000002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="67.304699999999997" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="0.26017200000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="1.0522100000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.035946405942380862" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="0.013174546258347637" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.023925260950642131" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.499116934157221e-07" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-2.7224287760583985e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.035946405942380862" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.499116934157221e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-2.7224287760583985e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_6" name="PE: 2018-06-08 14:17:42 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_7" name="PE: 2018-06-08 14:17:42 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_8" name="PE: 2018-06-08 14:26:46 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_9" name="PE: 2018-06-08 14:26:46 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267970000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569619999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309401423234" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349004762947e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741469596" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810332617734e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.0294605225512327e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309401423234" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810332617734e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.0294605225512327e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_10" name="PE: 2018-06-08 14:26:46 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267970000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569619999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309401423234" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349004762947e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741469596" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810332617734e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.0294605225512327e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309401423234" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810332617734e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.0294605225512327e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_11" name="PE: 2018-06-10 09:42:38 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267970000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569619999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309401423234" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349004762947e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741469596" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810332617734e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.0294605225512327e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309401423234" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810332617734e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.0294605225512327e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_12" name="PE: 2018-06-10 09:42:38 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.066421553508011058" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="91.007261278807945" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="51.399099640873985" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="94.166779633184618" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.091907984325952485" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="6.7011270773356427e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.028290003891903674" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="7.6251378093633844e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.2190880103255708e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.091907984325952485" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="7.6251378093633844e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.2190880103255708e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_13" name="PE: 2018-06-10 09:42:38 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.066421553508011058" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="91.007261278807945" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="51.399099640873985" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="94.166779633184618" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.091907984325952485" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="6.7011270773356427e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.028290003891903674" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="7.6251378093633844e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.2190880103255708e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.091907984325952485" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="7.6251378093633844e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.2190880103255708e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_14" name="PE: 2018-06-10 09:53:04 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.066421553508011058" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="91.007261278807945" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="51.399099640873985" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="94.166779633184618" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.091907984325952485" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="6.7011270773356427e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.028290003891903674" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="7.6251378093633844e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.2190880103255708e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.091907984325952485" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="7.6251378093633844e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.2190880103255708e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_15" name="PE: 2018-06-10 09:53:04 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.066421553509999995" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="91.007261278807945" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="60" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="94.166779633184618" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.10728746414016721" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="7.8211439760764439e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.032254175349411968" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="8.8995925545358954e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.6701666619404571e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.10728746414016721" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="8.8995925545358954e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.6701666619404571e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_16" name="PE: 2018-06-10 09:53:04 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.066421553509999995" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="91.007261278807945" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="60" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="94.166779633184618" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.10728746414016721" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="7.8211439760764439e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.032254175349411968" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="8.8995925545358954e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.6701666619404571e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.10728746414016721" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="8.8995925545358954e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.6701666619404571e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_17" name="PE: 2018-06-10 12:55:45 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.066421553509999995" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="91.007261278807945" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="60" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="94.166779633184618" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.10728746414016721" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="7.8211439760764439e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.032254175349411968" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="8.8995925545358954e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.6701666619404571e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.10728746414016721" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="8.8995925545358954e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.6701666619404571e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_18" name="PE: 2018-06-10 12:55:45 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_19" name="PE: 2018-06-10 12:55:45 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_20" name="PE: 2018-06-10 13:01:38 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_21" name="PE: 2018-06-10 13:01:38 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_22" name="PE: 2018-06-10 13:01:38 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_23" name="PE: 2018-06-10 13:05:07 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_24" name="PE: 2018-06-10 13:05:07 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_25" name="PE: 2018-06-10 13:05:07 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_26" name="PE: 2018-06-10 13:07:39 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_27" name="PE: 2018-06-10 13:07:39 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_28" name="PE: 2018-06-10 13:07:39 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_29" name="PE: 2018-06-10 13:08:33 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_30" name="PE: 2018-06-10 13:08:33 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_31" name="PE: 2018-06-10 13:08:33 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_32" name="PE: 2018-06-10 13:09:18 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_33" name="PE: 2018-06-10 13:09:18 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_34" name="PE: 2018-06-10 13:09:18 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_35" name="PE: 2018-06-10 13:09:57 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_36" name="PE: 2018-06-10 13:09:57 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_37" name="PE: 2018-06-10 13:09:57 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_38" name="PE: 2018-06-10 13:12:25 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_39" name="PE: 2018-06-10 13:12:25 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_40" name="PE: 2018-06-10 13:12:25 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_41" name="PE: 2018-06-11 06:42:15 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_42" name="PE: 2018-06-11 06:42:15 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_43" name="PE: 2018-06-11 06:42:15 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_44" name="PE: 2018-06-11 06:45:20 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_45" name="PE: 2018-06-11 06:45:20 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_46" name="PE: 2018-06-11 06:45:20 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_47" name="PE: 2018-06-11 06:50:05 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_48" name="PE: 2018-06-11 06:50:05 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_49" name="PE: 2018-06-11 06:50:05 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_50" name="PE: 2018-06-11 07:17:17 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_51" name="PE: 2018-06-11 07:17:17 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_52" name="PE: 2018-06-11 07:17:17 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_53" name="PE: 2018-06-11 07:20:09 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_54" name="PE: 2018-06-11 07:20:09 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_55" name="PE: 2018-06-11 07:20:09 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_0" name="PE: 2018-06-11 09:31:44 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_56" name="PE: 2018-06-11 09:31:44 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_57" name="PE: 2018-06-11 09:31:44 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[glucose]" value="1.1559087096315254e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[serine]" value="2.3860969612451564e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Compartments[comp1],Vector=Metabolites[biomass]" value="6.8525280189931684e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[alpha]" value="0.015469267967964818" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[beta]" value="80.812797364968063" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu_max]" value="28.540569620332811" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[kc]" value="56.087021915262333" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[a]" value="-0.25719999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[b]" value="-0.7651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[ms]" value="-0.0045999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v0]" value="0.00010428" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[v]" value="0.00010302999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_glucose]" value="0.018629828614371832" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[c_biomass]" value="0.11044247829027858" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[mu]" value="0.085579309402421172" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qp_s]" value="1.6364349002800629e-05" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[qs_g]" value="-0.026623518741724767" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[rp_s]" value="1.8620810330384835e-10" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel,Vector=Values[r_s]" value="-3.029460522580268e-07" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0.085579309402421172" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=rp_s" value="1.8620810330384835e-10" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[rp_s],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=r_s" value="-3.029460522580268e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel,Vector=Values[r_s],Reference=InitialValue>
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
      0 1.1559087096315254e+18 2.3860969612451564e+18 6.8525280189931684e+18 0.00010302999999999999 0.018629828614371832 0.11044247829027858 0.085579309402421172 1.6364349002800629e-05 -0.026623518741724767 1.8620810330384835e-10 -3.029460522580268e-07 1 0.015469267967964818 80.812797364968063 28.540569620332811 56.087021915262333 -0.25719999999999998 -0.7651 -0.0045999999999999999 0.00010428 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_14" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_9" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_15" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
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
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_16" name="Scan" type="scan" scheduled="false" updateModel="false">
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
    <Task key="Task_17" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_10" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_18" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_11" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_19" name="Parameter Estimation" type="parameterFitting" scheduled="true" updateModel="true">
      <Report reference="Report_12" target="parameter_report" append="1" confirmOverwrite="1"/>
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
            <Parameter name="StartValue" type="float" value="0.015469267967964818"/>
            <Parameter name="UpperBound" type="cn" value="100"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel,Vector=Values[beta],Reference=InitialValue"/>
            <Parameter name="StartValue" type="float" value="80.812797364968063"/>
            <Parameter name="UpperBound" type="cn" value="100"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel,Vector=Values[kc],Reference=InitialValue"/>
            <Parameter name="StartValue" type="float" value="56.087021915262333"/>
            <Parameter name="UpperBound" type="cn" value="100"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel,Vector=Values[mu_max],Reference=InitialValue"/>
            <Parameter name="StartValue" type="float" value="28.540569620332811"/>
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
    <Task key="Task_20" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_13" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_14"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_21" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_14" target="" append="1" confirmOverwrite="1"/>
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
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
      </Method>
    </Task>
    <Task key="Task_22" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_15" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_23" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_16" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_24" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_25" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
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
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_26" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_17" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value=""/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_9" name="Steady-State" taskType="steadyState" separator=" " precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_10" name="Elementary Flux Modes" taskType="fluxMode" separator=" " precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_11" name="Optimization" taskType="optimization" separator=" " precision="6">
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
    <Report key="Report_12" name="Parameter Estimation" taskType="parameterFitting" separator=" " precision="6">
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
    <Report key="Report_13" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator=" " precision="6">
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
    <Report key="Report_14" name="Lyapunov Exponents" taskType="lyapunovExponents" separator=" " precision="6">
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
    <Report key="Report_15" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator=" " precision="6">
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
    <Report key="Report_16" name="Sensitivities" taskType="sensitivities" separator=" " precision="6">
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
    <Report key="Report_17" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator=" " precision="6">
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
    <SBMLMap SBMLid="a" COPASIkey="ModelValue_4"/>
    <SBMLMap SBMLid="alpha" COPASIkey="ModelValue_0"/>
    <SBMLMap SBMLid="b" COPASIkey="ModelValue_5"/>
    <SBMLMap SBMLid="beta" COPASIkey="ModelValue_1"/>
    <SBMLMap SBMLid="biomass" COPASIkey="Metabolite_2"/>
    <SBMLMap SBMLid="c_biomass" COPASIkey="ModelValue_10"/>
    <SBMLMap SBMLid="c_glucose" COPASIkey="ModelValue_9"/>
    <SBMLMap SBMLid="comp1" COPASIkey="Compartment_0"/>
    <SBMLMap SBMLid="eq_biomass" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="eq_glucose" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="eq_serine" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="glucose" COPASIkey="Metabolite_0"/>
    <SBMLMap SBMLid="kc" COPASIkey="ModelValue_3"/>
    <SBMLMap SBMLid="ms" COPASIkey="ModelValue_6"/>
    <SBMLMap SBMLid="mu" COPASIkey="ModelValue_11"/>
    <SBMLMap SBMLid="mu_max" COPASIkey="ModelValue_2"/>
    <SBMLMap SBMLid="qp_s" COPASIkey="ModelValue_12"/>
    <SBMLMap SBMLid="qs_g" COPASIkey="ModelValue_13"/>
    <SBMLMap SBMLid="r_s" COPASIkey="ModelValue_15"/>
    <SBMLMap SBMLid="rp_s" COPASIkey="ModelValue_14"/>
    <SBMLMap SBMLid="serine" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="v" COPASIkey="ModelValue_8"/>
    <SBMLMap SBMLid="v0" COPASIkey="ModelValue_7"/>
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
