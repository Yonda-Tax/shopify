import {
  Card,
  Page,
  Layout,
  TextContainer,
  Image,
  Stack,
  Link,
  Heading,
} from "@shopify/polaris";
import { TitleBar } from "@shopify/app-bridge-react";

import { trophyImage } from "../assets";

export default function HomePage() {
  return (
    <Page narrowWidth>
      <TitleBar title="App name" primaryAction={null} />
      <Layout>
        <Layout.Section>
          <Card sectioned>
            <Stack
              wrap={false}
              spacing="extraTight"
              distribution="trailing"
              alignment="center"
            >
              <Stack.Item fill>
                <TextContainer spacing="loose">
                  <Heading>Thank you for installing the Yonda app</Heading>
                  <p>If you're already with us, you don't need to do anything - we will be able to deal with your sales tax filings automatically.</p>
                  <p>If you don't have a partner to file your sales tax returns for you, you should contact us.</p>
                  <p><Link url="mailto:hello@yondatax.com" external>Email us</Link> and we'll talk you through everything.</p>
                  <p>More information can be found on our website <Link url="https://www.yondatax.com">website</Link>.</p>
                </TextContainer>
              </Stack.Item>
              <Stack.Item>
                <div style={{ padding: "0 20px" }}>
                  <Image
                    source={trophyImage}
                    alt="Yonda logo"
                    width={120}
                  />
                </div>
              </Stack.Item>
            </Stack>
          </Card>
        </Layout.Section>
      </Layout>
    </Page>
  );
}
