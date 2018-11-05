<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.23 (Build 184) (http://www.copasi.org) at 2018-11-02 09:42:37 UTC -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="23" versionDevel="184" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_42" name="Function for EqVolume" type="UserDefined" reversible="true">
      <Expression>
        Fin/default_compartment
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_272" name="Fin" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_273" name="default_compartment" order="1" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Function for eq_biomass_1" type="UserDefined" reversible="true">
      <Expression>
        mu*biomass/default_compartment
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_270" name="biomass" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_271" name="default_compartment" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_266" name="mu" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Function for eq_glucose_1" type="UserDefined" reversible="unspecified">
      <Expression>
        (-qs*biomass+Fin*c_glufeed)/default_compartment
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_268" name="Fin" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_267" name="biomass" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_269" name="c_glufeed" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_295" name="default_compartment" order="3" role="volume"/>
        <ParameterDescription key="FunctionParameter_296" name="qs" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="Function for eq_serine_1" type="UserDefined" reversible="unspecified">
      <Expression>
        qp*biomass/default_compartment
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_301" name="biomass" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_300" name="default_compartment" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_299" name="qp" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_1" name="IDModel_1" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mol" type="deterministic" avogadroConstant="6.0221408570000002e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2018-10-01T14:33:18Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="default_compartment" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:bqmodel="http://biomodels.net/model-qualifiers/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_0">
    <bqmodel:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/biomodels.sbo/SBO:0000410" />
      </rdf:Bag>
    </bqmodel:is>
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2018-10-01T14:33:25Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_1" name="V" simulationType="reactions" compartment="Compartment_0" addNoise="false">
      </Metabolite>
      <Metabolite key="Metabolite_0" name="glucose" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2018-10-01T14:47:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_6" name="biomass" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_6">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2018-10-01T14:33:28Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="serine" simulationType="reactions" compartment="Compartment_0" addNoise="false">
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_13" name="mu_max" simulationType="fixed" addNoise="false">
      </ModelValue>
      <ModelValue key="ModelValue_12" name="Ks" simulationType="fixed" addNoise="false">
      </ModelValue>
      <ModelValue key="ModelValue_11" name="Ks_qs" simulationType="fixed" addNoise="false">
      </ModelValue>
      <ModelValue key="ModelValue_10" name="Ki" simulationType="fixed" addNoise="false">
      </ModelValue>
      <ModelValue key="ModelValue_9" name="qs_max" simulationType="fixed" addNoise="false">
      </ModelValue>
      <ModelValue key="ModelValue_8" name="alpha" simulationType="fixed" addNoise="false">
      </ModelValue>
      <ModelValue key="ModelValue_7" name="beta" simulationType="fixed" addNoise="false">
      </ModelValue>
      <ModelValue key="ModelValue_6" name="F0" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_6">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2018-10-01T15:40:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_5" name="mu_set" simulationType="fixed" addNoise="false">
      </ModelValue>
      <ModelValue key="ModelValue_4" name="Fin" simulationType="assignment" addNoise="false">
        <Expression>
          &lt;CN=Root,Model=IDModel_1,Vector=Values[F0],Reference=Value>*exp(&lt;CN=Root,Model=IDModel_1,Vector=Values[mu_set],Reference=Value>*&lt;CN=Root,Model=IDModel_1,Reference=Time>)/1000
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_3" name="c_glucose" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2018-10-01T15:28:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose],Reference=Concentration>/&lt;CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V],Reference=Concentration>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_2" name="c_glufeed" simulationType="fixed" addNoise="false">
      </ModelValue>
      <ModelValue key="ModelValue_1" name="mu" simulationType="assignment" addNoise="false">
        <Expression>
          &lt;CN=Root,Model=IDModel_1,Vector=Values[mu_max],Reference=Value>*&lt;CN=Root,Model=IDModel_1,Vector=Values[c_glucose],Reference=Value>/(&lt;CN=Root,Model=IDModel_1,Vector=Values[c_glucose],Reference=Value>+&lt;CN=Root,Model=IDModel_1,Vector=Values[Ks],Reference=Value>+&lt;CN=Root,Model=IDModel_1,Vector=Values[c_glucose],Reference=Value>^2/&lt;CN=Root,Model=IDModel_1,Vector=Values[Ki],Reference=Value>)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_0" name="qs" simulationType="assignment" addNoise="false">
        <Expression>
          &lt;CN=Root,Model=IDModel_1,Vector=Values[qs_max],Reference=Value>*&lt;CN=Root,Model=IDModel_1,Vector=Values[c_glucose],Reference=Value>/(&lt;CN=Root,Model=IDModel_1,Vector=Values[Ks_qs],Reference=Value>+&lt;CN=Root,Model=IDModel_1,Vector=Values[c_glucose],Reference=Value>)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_29" name="qp" simulationType="assignment" addNoise="false">
        <Expression>
          &lt;CN=Root,Model=IDModel_1,Vector=Values[alpha],Reference=Value>*&lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=Value>/(&lt;CN=Root,Model=IDModel_1,Vector=Values[beta],Reference=Value>+&lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=Value>)
        </Expression>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_1" name="EqVolume" reversible="true" fast="false" addNoise="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_3386" name="Fin" value="0.000385208"/>
        </ListOfConstants>
        <KineticLaw function="Function_42" unitType="Default" scalingCompartment="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_0" name="eq_biomass" reversible="true" fast="false" addNoise="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_3454" name="mu" value="0"/>
        </ListOfConstants>
        <KineticLaw function="Function_45" unitType="Default" scalingCompartment="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="ModelValue_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="eq_glucose" reversible="true" fast="false" addNoise="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_3626" name="Fin" value="0.000385208"/>
          <Constant key="Parameter_3846" name="c_glufeed" value="415"/>
          <Constant key="Parameter_3206" name="qs" value="0"/>
        </ListOfConstants>
        <KineticLaw function="Function_46" unitType="Default" scalingCompartment="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="ModelValue_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_296">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="eq_serine" reversible="true" fast="false" addNoise="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_3207" name="qp" value="0"/>
        </ListOfConstants>
        <KineticLaw function="Function_47" unitType="Default" scalingCompartment="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_300">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_2">
      <ModelParameterSet key="ModelParameterSet_2" name="Initial State">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_466" name="PE: 2018-11-02 09:22:14 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_465" name="PE: 2018-11-02 09:22:14 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.1363931001212242" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="4.9160532925654241" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="9.3110453466821657" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_464" name="PE: 2018-11-02 09:22:14 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.1363931001212242" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="4.9160532925654241" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="9.3110453466821657" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_463" name="PE: 2018-11-02 09:23:06 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_462" name="PE: 2018-11-02 09:23:06 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="1.9387966547617701" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.1581815084328038" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="3.8614122082036704" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="7.0691884263498901" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_461" name="PE: 2018-11-02 09:23:06 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="1.9387966547617701" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.1581815084328038" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="3.8614122082036704" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="7.0691884263498901" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_460" name="PE: 2018-11-02 09:24:01 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_459" name="PE: 2018-11-02 09:24:01 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="0.044116461070664192" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="0.79489686186580411" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="9.1581417214045651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="3.1750184980372338" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_458" name="PE: 2018-11-02 09:24:01 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="0.044116461070664192" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="0.79489686186580411" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="9.1581417214045651" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="3.1750184980372338" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_457" name="PE: 2018-11-02 09:26:53 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_456" name="PE: 2018-11-02 09:26:53 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.2002617555725599" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.2162578249438414" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="0.9640194847258764" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="1.7507074219124374" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_455" name="PE: 2018-11-02 09:26:53 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.2002617555725599" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.2162578249438414" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="0.9640194847258764" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="1.7507074219124374" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_454" name="PE: 2018-11-02 09:27:12 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_453" name="PE: 2018-11-02 09:27:12 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.4485052386959389" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.3165282797301321" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="3.6805402858643692" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="6.9303423336962249" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_452" name="PE: 2018-11-02 09:27:12 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.4485052386959389" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.3165282797301321" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="3.6805402858643692" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="6.9303423336962249" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_451" name="PE: 2018-11-02 09:35:46 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_450" name="PE: 2018-11-02 09:35:46 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.3711649986789394" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.2937278075355769" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="3.7628944018702857" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="7.0885508436135911" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_449" name="PE: 2018-11-02 09:35:46 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.3711649986789394" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.2937278075355769" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="3.7628944018702857" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="7.0885508436135911" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_448" name="PE: 2018-11-02 09:36:33 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_447" name="PE: 2018-11-02 09:36:33 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.3677931472411031" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.2861899999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="4.5987035001504539" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="8.6738431268608505" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_446" name="PE: 2018-11-02 09:36:33 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.3677931472411031" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.2861899999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="4.5987035001504539" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="8.6738431268608505" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_445" name="PE: 2018-11-02 09:37:53 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_444" name="PE: 2018-11-02 09:37:53 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.8024499999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4554948336121152" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5.2628310914408241" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="9.9551323037975958" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_443" name="PE: 2018-11-02 09:37:53 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.8024499999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4554948336121152" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5.2628310914408241" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="9.9551323037975958" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_442" name="PE: 2018-11-02 09:38:23 Exp: Original">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="5.6048999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4291" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_441" name="PE: 2018-11-02 09:38:23 Exp: Experiment">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.6783691743345845" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4075311466133544" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="1.5006483958341259" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="2.7713455471705588" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_440" name="PE: 2018-11-02 09:38:23 Exp: Experiment_1">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1" value="12.5" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V]" value="6.148605814997e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass]" value="1.261662598104928e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_max]" value="0.2477" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks]" value="1.4343999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs]" value="2.6783691743345845" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Ki]" value="6888309" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs_max]" value="1.4075311466133544" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[alpha]" value="1.5006483958341259" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[beta]" value="2.7713455471705588" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[F0]" value="0.29999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu_set]" value="0.02" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[Fin]" value="0.0003852076250063224" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[c_glufeed]" value="415" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[mu]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qs]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Values[qp]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[EqVolume],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_biomass],ParameterGroup=Parameters,Parameter=mu" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=Fin" value="0.0003852076250063224" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=c_glufeed" value="415" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[c_glufeed],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_glucose],ParameterGroup=Parameters,Parameter=qs" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=IDModel_1,Vector=Reactions[eq_serine],ParameterGroup=Parameters,Parameter=qp" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_1"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="ModelValue_4"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
      <StateTemplateVariable objectReference="ModelValue_29"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
      <StateTemplateVariable objectReference="ModelValue_13"/>
      <StateTemplateVariable objectReference="ModelValue_12"/>
      <StateTemplateVariable objectReference="ModelValue_11"/>
      <StateTemplateVariable objectReference="ModelValue_10"/>
      <StateTemplateVariable objectReference="ModelValue_9"/>
      <StateTemplateVariable objectReference="ModelValue_8"/>
      <StateTemplateVariable objectReference="ModelValue_7"/>
      <StateTemplateVariable objectReference="ModelValue_6"/>
      <StateTemplateVariable objectReference="ModelValue_5"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
    </StateTemplate>
    <InitialState type="initialState">
      12.5 6.148605814997e+22 0 1.261662598104928e+23 0 0.0003852076250063224 0 0 0 0 1 0.2477 1.4343999999999999 5.6048999999999998 6888309 1.4291 5 0.5 0.29999999999999999 0.02 415 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_26" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_18" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_25" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="330"/>
        <Parameter name="StepSize" type="float" value="0.10000000000000001"/>
        <Parameter name="Duration" type="float" value="33"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="12.5"/>
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
    <Task key="Task_24" name="Scan" type="scan" scheduled="false" updateModel="false">
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
    <Task key="Task_23" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_17" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_22" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_16" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_21" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_15" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
          <ParameterGroup name="FitItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Values[alpha],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="10"/>
            <Parameter name="StartValue" type="float" value="5"/>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Values[beta],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="10"/>
            <Parameter name="StartValue" type="float" value="0.5"/>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Values[Ks_qs],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="2.241960000"/>
            <Parameter name="UpperBound" type="cn" value="8.967840000"/>
            <Parameter name="StartValue" type="float" value="5.6048999999999998"/>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Values[qs_max],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="1.143280000"/>
            <Parameter name="UpperBound" type="cn" value="1.714920000"/>
            <Parameter name="StartValue" type="float" value="1.4291"/>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="1"/>
        <ParameterGroup name="Experiment Set">
          <ParameterGroup name="Experiment">
            <Parameter name="Key" type="key" value="Experiment_21"/>
            <Parameter name="File Name" type="file" value="fedbatch_amounts/R23_amounts.csv"/>
            <Parameter name="First Row" type="unsignedInteger" value="1"/>
            <Parameter name="Last Row" type="unsignedInteger" value="6"/>
            <Parameter name="Experiment Type" type="unsignedInteger" value="1"/>
            <Parameter name="Normalize Weights per Experiment" type="bool" value="1"/>
            <Parameter name="Separator" type="string" value=","/>
            <Parameter name="Weight Method" type="unsignedInteger" value="1"/>
            <Parameter name="Data is Row Oriented" type="bool" value="1"/>
            <Parameter name="Row containing Names" type="unsignedInteger" value="1"/>
            <Parameter name="Number of Columns" type="unsignedInteger" value="5"/>
            <ParameterGroup name="Object Map">
              <ParameterGroup name="0">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="1">
                <Parameter name="Role" type="unsignedInteger" value="3"/>
              </ParameterGroup>
              <ParameterGroup name="2">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose],Reference=Concentration"/>
              </ParameterGroup>
              <ParameterGroup name="3">
                <Parameter name="Role" type="unsignedInteger" value="2"/>
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass],Reference=Concentration"/>
              </ParameterGroup>
              <ParameterGroup name="4">
                <Parameter name="Role" type="unsignedInteger" value="2"/>
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine],Reference=Concentration"/>
              </ParameterGroup>
            </ParameterGroup>
          </ParameterGroup>
          <ParameterGroup name="Experiment_1">
            <Parameter name="Key" type="key" value="Experiment_20"/>
            <Parameter name="File Name" type="file" value="fedbatch_amounts/R24_amounts.csv"/>
            <Parameter name="First Row" type="unsignedInteger" value="1"/>
            <Parameter name="Last Row" type="unsignedInteger" value="6"/>
            <Parameter name="Experiment Type" type="unsignedInteger" value="1"/>
            <Parameter name="Normalize Weights per Experiment" type="bool" value="1"/>
            <Parameter name="Separator" type="string" value=","/>
            <Parameter name="Weight Method" type="unsignedInteger" value="1"/>
            <Parameter name="Data is Row Oriented" type="bool" value="1"/>
            <Parameter name="Row containing Names" type="unsignedInteger" value="1"/>
            <Parameter name="Number of Columns" type="unsignedInteger" value="5"/>
            <ParameterGroup name="Object Map">
              <ParameterGroup name="0">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="1">
                <Parameter name="Role" type="unsignedInteger" value="3"/>
              </ParameterGroup>
              <ParameterGroup name="2">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose],Reference=Concentration"/>
              </ParameterGroup>
              <ParameterGroup name="3">
                <Parameter name="Role" type="unsignedInteger" value="2"/>
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass],Reference=Concentration"/>
              </ParameterGroup>
              <ParameterGroup name="4">
                <Parameter name="Role" type="unsignedInteger" value="2"/>
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine],Reference=Concentration"/>
              </ParameterGroup>
            </ParameterGroup>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_20" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_14" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_26"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_19" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_13" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_18" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_12" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_17" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_11" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_16" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_15" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
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
        <Parameter name="ConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
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
    <Task key="Task_27" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_10" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value=""/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_18" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_17" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_16" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_15" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_14" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_13" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_12" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_11" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_10" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <ListOfPlots>
    <PlotSpecification name="Experiment" type="Plot2D" active="1" taskTypes="Parameter Estimation">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[serine](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Parameter Estimation Result" type="Plot2D" active="1" taskTypes="Parameter Estimation">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="Experiment,[serine](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Experiment,[serine](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Experiment,[serine](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Concentrations, Volumes, and Global Quantity Values" type="Plot2D" active="1" taskTypes="">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[V]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[V],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[glucose]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[glucose],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[biomass],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Vector=Compartments[default_compartment],Vector=Metabolites[serine],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[Fin]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Vector=Values[Fin],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[c_glucose]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Vector=Values[c_glucose],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[mu]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Vector=Values[mu],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[qs]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Vector=Values[qs],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[qp]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=IDModel_1,Vector=Values[qp],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Experiment_1" type="Plot2D" active="1" taskTypes="Parameter Estimation">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[serine](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Experiment_2" type="Plot2D" active="1" taskTypes="Parameter Estimation">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[glucose](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[glucose](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[glucose](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#00E600"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[2],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#00E600"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[2],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#00E600"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[2],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Experiment_3" type="Plot2D" active="1" taskTypes="Parameter Estimation">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[biomass](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Experiment_4" type="Plot2D" active="1" taskTypes="Parameter Estimation">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[biomass](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Experiment_1_1" type="Plot2D" active="1" taskTypes="Parameter Estimation">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[biomass](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[biomass](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[1],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[1],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[serine](Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#0000FF"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[1],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
  </ListOfPlots>
  <GUI>
  </GUI>
  <SBMLReference file="model_fedbatch.xml">
    <SBMLMap SBMLid="EqVolume" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="F0" COPASIkey="ModelValue_6"/>
    <SBMLMap SBMLid="Fin" COPASIkey="ModelValue_4"/>
    <SBMLMap SBMLid="Ki" COPASIkey="ModelValue_10"/>
    <SBMLMap SBMLid="Ks" COPASIkey="ModelValue_12"/>
    <SBMLMap SBMLid="Ks_qs" COPASIkey="ModelValue_11"/>
    <SBMLMap SBMLid="V" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="alpha" COPASIkey="ModelValue_8"/>
    <SBMLMap SBMLid="beta" COPASIkey="ModelValue_7"/>
    <SBMLMap SBMLid="biomass" COPASIkey="Metabolite_6"/>
    <SBMLMap SBMLid="c_glucose" COPASIkey="ModelValue_3"/>
    <SBMLMap SBMLid="c_glufeed" COPASIkey="ModelValue_2"/>
    <SBMLMap SBMLid="default_compartment" COPASIkey="Compartment_0"/>
    <SBMLMap SBMLid="eq_biomass" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="eq_glucose" COPASIkey="Reaction_6"/>
    <SBMLMap SBMLid="eq_serine" COPASIkey="Reaction_7"/>
    <SBMLMap SBMLid="glucose" COPASIkey="Metabolite_0"/>
    <SBMLMap SBMLid="mu" COPASIkey="ModelValue_1"/>
    <SBMLMap SBMLid="mu_max" COPASIkey="ModelValue_13"/>
    <SBMLMap SBMLid="mu_set" COPASIkey="ModelValue_5"/>
    <SBMLMap SBMLid="qp" COPASIkey="ModelValue_29"/>
    <SBMLMap SBMLid="qs" COPASIkey="ModelValue_0"/>
    <SBMLMap SBMLid="qs_max" COPASIkey="ModelValue_9"/>
    <SBMLMap SBMLid="serine" COPASIkey="Metabolite_7"/>
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
    <UnitDefinition key="Unit_17" name="liter" symbol="l">
      <Expression>
        0.001*m^3
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_20" name="mole" symbol="mol">
      <Expression>
        Avogadro*#
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
